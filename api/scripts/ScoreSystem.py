from models.AdminScoreRuleModel import AdminScoreRule
from models.AdminScoreOptionModel import AdminScoreOption
from models.PymeExpressIndicatorsModel import PymeExpressIndicator
from models.PymeTraditionalIndicatorsModel import PymeTraditionalIndicator
from models.AdminScoreModel import AdminScore
from collections import defaultdict
from utils.utils import forecast
from utils.Logger import Logger
import json

logger = Logger('logs')

class ScoreSystem:

    def __init__(self, cap):
        self.cap = cap
        self.score = cap.score or 0
        self.id_naira = cap.id
        self.router = cap.router
        self.risk_level = ""
        self.line_factor = 0

    def execute(self):
        # Get all score rules (aggregation|express) and check options for each rule
        # Check values to obtain an score (nim, max, value)
        # Sum all score and return Final config score from (1-100) to AdminScore
        score = []
        scoreHistoryArray = []
        logger.logTo(self.id_naira, f'Starting {self.router} scoring with {self.score}', self.__class__.__name__)
        if self.router == 'express':
            rules = AdminScoreRule.query.filter_by(pyme_express = True).all()
        if self.router == 'tradicional':
            rules = AdminScoreRule.query.filter_by(pyme_traditional = True).all()

        for rule in rules:
            scoreHistory = defaultdict(list)
            scoreHistory["id"] = rule.id
            scoreHistory["name"] = rule.name
            scoreHistory["weight"] = rule.weight
            scoreHistory["use_field_value"] = rule.use_field_value
            model, field = self.__getModel(rule.field)
            scoreHistory["score"] = getattr(model, field)* rule.weight if rule.use_field_value == True else None
            scoreConditions = []
            logger.logTo(self.id_naira, f'Checking score-rule {rule.name}', self.__class__.__name__)
            options = AdminScoreOption.query.filter_by(rule_id=rule.id).order_by(AdminScoreOption.ratio.asc())
            if rule.use_field_value == True:
                # If this field is checked total score is field.value * weight
                # All conditions are ignored
                logger.logTo(self.id_naira, f' use_field_value check detected {rule.name}', self.__class__.__name__)
                model, field = self.__getModel(rule.field)
                score.append(getattr(model, field) * rule.weight)
                logger.logTo(self.id_naira, f'  MATCH!!! {field} with \'{getattr(model, field)}\' Adding {getattr(model, field)* rule.weight} ({getattr(model, field)} * {rule.weight})', self.__class__.__name__)
            else:
                # Conditions marked as important are checked first
                optionsScore = 0
                for option in options:
                    # Get model
                    model, field = self.__getModel(rule.field)
                    # Check value
                    if option.value != None:
                        if self.__chekValue(option.value, field, model):
                            score.append(option.ratio * rule.weight)
                            optionsScore = optionsScore + (option.ratio * rule.weight)
                            logger.logTo(self.id_naira, f'  MATCH!!! {field} with \'{option.value}\' Adding {option.ratio * rule.weight} ({option.ratio} * {rule.weight})', self.__class__.__name__)
                            scoreConditions.append({"min": None, "max": None, "use_field_value": False,
                            "ratio": option.ratio, "value": option.value , "score": option.ratio * rule.weight})
                            break
                    # Check range
                    else:
                        if self.__checkRangeValue(option.min, option.max, field, model):
                            score.append(option.ratio * rule.weight)
                            optionsScore = optionsScore + (option.ratio * rule.weight)
                            logger.logTo(self.id_naira, f'  MATCH!!! {field} {option.min}-{option.max} Adding {option.ratio * rule.weight} ({option.ratio} * {rule.weight})', self.__class__.__name__)
                            scoreConditions.append({"min": option.min, "max": option.max, "use_field_value": False,
                            "ratio": option.ratio, "value": None , "score": option.ratio * rule.weight})
                            break
                scoreHistory["score"] = optionsScore
            scoreHistory["conditions"] = scoreConditions
            scoreHistoryArray.append(scoreHistory)
        self.scoreHistory = json.dumps(scoreHistoryArray)
        score = sum(score) + self.score

        if self.router == 'express':
            model, field = self.__getModel("express.-")

            if model.observation_keys != 3 and model.liquid_pledge == "Sí":
                score = 100
                logger.logTo(self.id_naira, f'Score overwritting by conditions to {score}', self.__class__.__name__)

        logger.logTo(self.id_naira, f'Final (1-100) Score is {score}', self.__class__.__name__)

        self.line_factor = forecast([10, 9, 8, 7, 6], [100, 95, 90, 80, 70], score/10)
        # self.line_factor = ( (((score - 40) * (100 - 70) ) / (100 - 40) ) + 70 ) / 100

        if score > 90:
            self.risk_level = "Muy bajo"
            #self.line_factor = 0.95
        elif score > 80:
            self.risk_level = "Bajo"
            #self.line_factor = 0.90
        elif score > 60:
            self.risk_level = "Medio bajo"
            #self.line_factor = 0.80
        elif score > 40:
            self.risk_level = "Medio alto"
            #self.line_factor = 0.70
        elif score > 20:
            self.risk_level = "Alto"
            self.line_factor = 0
        else:
            self.risk_level = "Muy alto"
            self.line_factor = 0


        self.score = self.__getFinalScore(score)

        # logger.logTo(self.id_naira, f'Final Sophia {self.cap.router} score is {self.score.score}', self.__class__.__name__)
        return(self.score, score, self.risk_level, self.line_factor, self.scoreHistory)

    def __checkRangeValue(self, min, max, field, model):
        logger.logTo(self.id_naira, f'  Checking {field} {min}-{max} with {getattr(model, field)}', self.__class__.__name__)
        if (getattr(model, field) or 0) >= min and (getattr(model, field) or 0) < max:
            return True
        return False
    
    def __chekValue(self, value, field, model):
        ## All fields are transformed to str()
        logger.logTo(self.id_naira, f'  Checking {field} with \'{value}\'', self.__class__.__name__)
        if str(value) == str(getattr(model, field)):
            return True
        return False
    
    def __getModel(self, field):
        list = str(field).split('.')
        if list[0] == 'express':
            return PymeExpressIndicator.query.filter_by(naira_id=self.cap.id).first(), list[1]
        elif list[0] == 'traditional':
            return PymeTraditionalIndicator.query.filter_by(naira_id=self.cap.id).first(), list[1]
        else:
            return self.cap, list[0]
    
    def __getFinalScore(self, score):
        return AdminScore.query.filter(getattr(AdminScore,'min')<= score, getattr(AdminScore,'max')  >= score).first()

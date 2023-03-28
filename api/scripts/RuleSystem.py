# from api import db
from models.AdminRuleModel import AdminRule
from models.AdminConditionModel import AdminCondition
from models.AdminStatusModel import AdminStatus
from models.PymeExpressIndicatorsModel import PymeExpressIndicator
from models.PymeTraditionalIndicatorsModel import PymeTraditionalIndicator
from utils.Logger import Logger
from collections import defaultdict
import json

logger = Logger('logs')

class RuleSystem:

    def __init__(self, cap):
        self.cap = cap
        self.status = None
        self.matchedReasons = []
        self.ruleHistory = {}
        self.id_naira = cap.id
        self.router = cap.router

    def execute(self):
        # Get all rules and check conditions for each rule
        # Get model and check values (min, max, allowed, allowed_na)
        # If ALL conditions checks, set status
        # Finally compare all status and get heavier
        actions = []
        ruleHistoryArray = []

        logger.logTo(self.id_naira, f'Starting', self.__class__.__name__)
        # Check app router (Now only express)
        if self.router == 'express':
            rules = AdminRule.query.filter_by(pyme_express=True).order_by(AdminRule.order.asc())
        elif self.router == 'tradicional':
            rules = AdminRule.query.filter_by(pyme_traditional=True).order_by(AdminRule.order.asc())
        #elif self.router == 'other': # Add here new routers
        #  rules = AdminRule.query.filter_by(other=True)
        
        for rule in rules:
            matches = []
            ruleHistory = defaultdict(list)
            ruleHistory["id"] = rule.id
            ruleHistory["name"] = rule.name
            ruleConditions = []
            logger.logTo(self.id_naira, f'Checking rule {rule.name}', self.__class__.__name__)
            conditions = AdminCondition.query.filter_by(rule_id=rule.id).order_by(AdminCondition.order.asc())
            # Conditions are ordered by order field
            for condition in conditions:
                model, field = self.__getModel(condition.field)
                if model == None:
                    # If we have a missing model (equifax) skip rule
                    matches.append(False)
                    break
                if condition.min != None and condition.min >= 0 and condition.max == None:
                    value = self.__checkMinValue(condition.min, field, model)
                if condition.max != None and condition.max >=0 and condition.min == None:
                    value = self.__checkMaxValue(condition.max, field, model)
                if condition.max != None and condition.min != None and condition.min < condition.max:
                   value = self.__checkBeetweenValue(condition.min, condition.max, field, model)
                if condition.allowed:
                    value = self.__chekAllowedValue(condition.allowed, condition.allowed_na, field, model)
                matches.append(value)
                ruleConditions.append({"min": condition.min, "max": condition.max, "allowed": condition.allowed,
                "allowed_na": condition.allowed_na, "field": field, "value": None if value is None else getattr(model, field), "status": value})

                # if False in matches or None in matches:
                    # Break if one of the conditions is False
                    # break # egarcia: Se elimina el break (Se ejecutan todas)
                    
            
            # Add here special actions based on conditions result
            logger.logTo(self.id_naira, f'Matches {matches}', self.__class__.__name__)

            if True in matches:
                self.matchedReasons.append(f'[{rule.id}] {rule.name} {str(rule.actions)}')

                actions.append(rule.actions)
                ruleHistory["status"] = str(rule.actions)
                ruleHistory["match"] = True
            else:
                actions.append(None)
                ruleHistory["status"] = None
                ruleHistory["match"] = False

            ruleHistory["conditions"] = ruleConditions
            ruleHistoryArray.append(ruleHistory)

        self.ruleHistory = json.dumps(ruleHistoryArray)
        logger.logTo(self.id_naira, f'Rule actions {actions}', self.__class__.__name__)
        self.__getFinalAction(actions)

        logger.logTo(self.id_naira, f'Final Status for actions {actions} is {self.status}', self.__class__.__name__)

        return(self.status, self.matchedReasons, self.ruleHistory)

    def __checkMinValue(self, min, field, model):
        try:
            logger.logTo(self.id_naira, f'  Checking {field} Min value {min} with {getattr(model, field)}', self.__class__.__name__)
            if (getattr(model, field) or 0) < (min):
                logger.logTo(self.id_naira, f'  MATCH!!! Min value {field} {min}', self.__class__.__name__)
                return True
            return False
        except AttributeError as error:
            logger.logTo(self.id_naira, f'  Error field {field} is not in model {model}', self.__class__.__name__)
            return None

    def __checkMaxValue(self, max, field, model):
        try:
            logger.logTo(self.id_naira, f'  Checking {field} Max value {max} with {getattr(model, field)}', self.__class__.__name__)
            if (getattr(model, field) or 0) > max:
                logger.logTo(self.id_naira, f'  MATCH!!! Max value {field} {max}', self.__class__.__name__)
                return True
            return False
        except AttributeError as error:
            logger.logTo(self.id_naira, f'  Error field {field} is not in model {model}', self.__class__.__name__)
            return None

    def __checkBeetweenValue(self, min, max, field, model):
        try:
            logger.logTo(self.id_naira, f'  Checking {field} Beetween value {min}-{max} with {getattr(model, field)}', self.__class__.__name__)
            if (getattr(model, field) or 0) > min and (getattr(model, field) or 0) < max:
                logger.logTo(self.id_naira, f'  MATCH!!! Beetween value {field} {min}-{max}', self.__class__.__name__)
                return True
            return False
        except AttributeError as error:
            logger.logTo(self.id_naira, f'  Error field {field} is not in model {model}', self.__class__.__name__)
            return None
    
    def __chekAllowedValue(self, allowed, allowed_na, field, model):
        try:
            allowed =list(map(lambda x: x, allowed))
            ## Some calculated fields are stored as bool or float, to make possible comparations we translate all to Bool
            ## All fields are transformed to str()
            fieldValue = bool(getattr(model, field)) if field.find('alert_') != -1 or field.find('flag_') != -1 else getattr(model, field)
            logger.logTo(self.id_naira, f'  Checking {field} with \'{fieldValue}\' in allowed values {allowed} nullable={allowed_na}', self.__class__.__name__)
            if allowed_na and fieldValue == None:
                logger.logTo(self.id_naira, f'  MATCH!!! allowed Null', self.__class__.__name__)
                return True
            if str(fieldValue) in allowed:
                logger.logTo(self.id_naira, f'  MATCH!!! allowed value {field}', self.__class__.__name__)
                return True
            return False
        except AttributeError as error:
            logger.logTo(self.id_naira, f'  Error field {field} is not in model {model}', self.__class__.__name__)
            return None
    
    def __getModel(self, field):
        list = str(field).split('.')
        if list[0] == 'express':
            return PymeExpressIndicator.query.filter_by(naira_id=self.cap.id).first(), list[1]
        elif list[0] == 'traditional':
            return PymeTraditionalIndicator.query.filter_by(naira_id=self.cap.id).first(), list[1]
        else:
            return self.cap, list[0]

    def __getFinalAction(self, actions):
        for action in actions:
            if action is not None:
                self.status = AdminStatus.query.filter_by(status=str(action)).first()
                return action
        self.status = AdminStatus.query.filter_by(status="=").first()
        return None
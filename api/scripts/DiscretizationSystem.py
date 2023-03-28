# from api import db
from models.AdminDiscretizationModel import AdminDiscretization
from models.AdminDiscretizationConditionModel import AdminDiscretizationCondition
from models.PymeExpressIndicatorsModel import PymeExpressIndicator
from models.PymeTraditionalIndicatorsModel import PymeTraditionalIndicator
from utils.Logger import Logger

logger = Logger('logs')

class DiscretizationSystem:

    def __init__(self, cap):
        self.cap = cap
        self.router = cap.router
        self.id_naira = cap.id
        self.indicators = None

    def execute(self):

        actions = []
        ruleHistoryArray = []

        logger.logTo(self.id_naira, f'Starting ', self.__class__.__name__)

        if self.router == 'express':
            discretizations = AdminDiscretization.query.filter_by(pyme_express = True).all()
            self.indicators = PymeExpressIndicator.query.filter_by(naira_id=self.id_naira).first()
        elif self.router == 'tradicional':
            discretizations = AdminDiscretization.query.filter_by(pyme_traditional = True).all()
            self.indicators = PymeTraditionalIndicator.query.filter_by(naira_id=self.id_naira).first()

        for discretization in discretizations:
            logger.logTo(self.id_naira, f'Discretizing {discretization.field}', self.__class__.__name__)

            conditions = AdminDiscretizationCondition.query.filter_by(discretization_id=discretization.id).order_by(AdminDiscretizationCondition.order.asc())

            # Conditions marked as important are checked first
            for condition in conditions:
                model, field = self.__getModel(discretization.field)

                if condition.min != None and condition.max == None:
                    value = self.__checkMinValue(condition.min, field, model)
                if condition.max != None and condition.min == None:
                    value = self.__checkMaxValue(condition.max, field, model)
                if condition.max != None and condition.min != None and condition.min < condition.max:
                   value = self.__checkBeetweenValue(condition.min, condition.max, field, model)
                if condition.allowed or condition.allowed_na:
                    value = self.__chekAllowedValue(condition.allowed, condition.allowed_na, field, model)

                if value:
                    target_field = str(discretization.target).split('.')[1]
                    setattr(self.indicators, target_field, condition.final_value)
                    #indicators[target_field] = condition.final_value
                    logger.logTo(self.id_naira, f'({target_field} updating from {getattr(model, field)} to {condition.final_value}', self.__class__.__name__)
                    break

    def __checkMinValue(self, min, field, model):
        try:
            logger.logTo(self.id_naira, f'  Checking {field} Min value {min} with {getattr(model, field)}', self.__class__.__name__)
            if getattr(model, field) < min:
                logger.logTo(self.id_naira, f'  MATCH!!! Min value {field} {min}', self.__class__.__name__)
                return True
            return False
        except AttributeError as error:
            logger.logTo(self.id_naira, f'  Error field {field} is not in model {model}', self.__class__.__name__)
            return None

    def __checkMaxValue(self, max, field, model):
        try:
            logger.logTo(self.id_naira, f'  Checking {field} Max value {max} with {getattr(model, field)}', self.__class__.__name__)
            if getattr(model, field) > max:
                logger.logTo(self.id_naira, f'  MATCH!!! Max value {field} {max}', self.__class__.__name__)
                return True
            return False
        except AttributeError as error:
            logger.logTo(self.id_naira, f'  Error field {field} is not in model {model}', self.__class__.__name__)
            return None

    def __checkBeetweenValue(self, min, max, field, model):
        try:
            logger.logTo(self.id_naira, f'  Checking {field} Beetween value {min}-{max} with {getattr(model, field)}', self.__class__.__name__)
            if getattr(model, field) >= min and getattr(model, field) < max:
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
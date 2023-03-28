from models.AdminAggrupationModel import AdminAggrupation
from models.AdminAggrupationOptionModel import AdminAggrupationOption
from models.PymeExpressIndicatorsModel import PymeExpressIndicator
from models.PymeTraditionalIndicatorsModel import PymeTraditionalIndicator
from models.LeasingIndicatorsModel import LeasingIndicator
from models.FactoringIndicatorsModel import FactoringIndicator
from collections import defaultdict
from utils.Logger import Logger
import json

logger = Logger('logs')

class AggrupationSystem:

    def __init__(self, cap):
        self.cap = cap
        self.id_naira = cap.id
        self.router = cap.router

    def execute(self):
        # Get all aggrupation lines for selected router
        # Check all options
        # Calculate final value for all agrupation lines and store
        aggrupationHistoryArray = []
        logger.logTo(self.id_naira, f'Starting {self.router} Aggrupation', self.__class__.__name__)
        aggrupations = AdminAggrupation.query.filter_by(router = self.router)
        for aggrupation in aggrupations:
            aggrupationHistory = defaultdict(list)
            aggrupationHistory["id"] = aggrupation.id
            aggrupationHistory["name"] = aggrupation.name
            aggrupationHistory["router"] = aggrupation.router
            logger.logTo(self.id_naira, f'Checking aggrupation {aggrupation.name}', self.__class__.__name__)
            options = AdminAggrupationOption.query.filter_by(aggrupation_id=aggrupation.id)
            aggrupationValue = 0
            aggrupationOptions = []
            for option in options:
              # Get model
              optionModel, optionField = self.__getModel(option.field)
              # Calculations
              aggrupationValue += (getattr(optionModel, optionField) * option.percentage) / 100
              logger.logTo(self.id_naira, f'Aggrupation: Value {aggrupationValue} = {option.percentage} * {getattr(optionModel, optionField)}', self.__class__.__name__)
              aggrupationOptions.append({"field": optionField, "percentage": option.percentage})
            logger.logTo(self.id_naira, f'Aggrupation {aggrupation.name} has {aggrupationValue} as final value', self.__class__.__name__)
            # Store final value
            if self.router == "express":
                model = PymeExpressIndicator.query.filter_by(naira_id=self.id_naira).first()
            elif self.router == "tradicional":
                model = PymeTraditionalIndicator.query.filter_by(naira_id=self.id_naira).first()
            elif self.router == "factoraje":
                model = FactoringIndicator.query.filter_by(naira_id=self.id_naira).first()
            elif self.router == "arrendamiento":
                model = LeasingIndicator.query.filter_by(naira_id=self.id_naira).first()
            setattr(model, str(aggrupation.field).split('.')[1], aggrupationValue)
            aggrupationHistory["conditions"] = aggrupationOptions
            aggrupationHistoryArray.append(aggrupationHistory)
        self.aggrupationHistory = json.dumps(aggrupationHistoryArray)
        logger.logTo(self.id_naira, f'Ending Aggrupation process', self.__class__.__name__)
        return(self.aggrupationHistory)

    def __getModel(self, field):
        list = str(field).split('.')
        if list[0] == 'express':
            return PymeExpressIndicator.query.filter_by(naira_id=self.cap.id).first(), list[1]
        if list[0] == 'traditional':
            return PymeTraditionalIndicator.query.filter_by(naira_id=self.cap.id).first(), list[1]
        else:
            return self.cap, list[0]
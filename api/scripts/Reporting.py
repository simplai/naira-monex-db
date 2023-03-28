from api import db
from utils.Logger import Logger
import time
from datetime import datetime, timedelta

logger = Logger('logs')

class Reporting:

    def __init__(self, id_naira, data):

        self.id_naira = id_naira
        self.data = data

        self.financial_liability_total = 0
        # Calculated data
        self.roe = 0
        self.ebitda_margin = 0
        self.utility_margin = 0
        self.financial_debt_ebitda = 0
        self.liquity = 0
        self.leverage_rate = 0
        self.net_debt_ebitda = 0
        self.ebitda_liability = 0
        self.ebitda_financial_liability = 0
        self.sales_evolution = 0
        self.ebitda_evolution = 0
        self.available_balance = 0

    def to_dict(self):
        return {
            'naira_id': self.id_naira,

            'financial_liability_total': self.financial_liability_total,

            'roe': self.roe,
            'ebitda_margin': self.ebitda_margin,
            'utility_margin': self.utility_margin,
            'financial_debt_ebitda': self.financial_debt_ebitda,
            'liquity': self.liquity,
            'leverage_rate': self.leverage_rate,
            'net_debt_ebitda': self.net_debt_ebitda,
            'ebitda_liability': self.ebitda_liability,
            'ebitda_financial_liability': self.ebitda_financial_liability,
            'sales_evolution': self.sales_evolution,
            'ebitda_evolution': self.ebitda_evolution,
            'available_balance': self.available_balance,

            'exec_time': self.exec_time,
        }

    def execute(self):
        start_time = time.monotonic()
        logger.logTo(self.id_naira, f'Getting reporting data', self.__class__.__name__)

        keys = self.data.keys()
        data = self.data

        self.financial_liability_total = data["financial_liability_total"]

        self.roe = self.ratio(data["net_utility_ltm"][0], data["stockholders_equity"][0])
        self.ebitda_margin = self.ratio(data["ebitda_ltm"][0], data["sales_ltm"][0])
        self.utility_margin = self.ratio(data["net_utility_ltm"][0], data["sales_ltm"][0])
        self.financial_debt_ebitda = self.ratio(data["financial_liability_total"], data["ebitda_ltm"][0])
        self.liquity = None # TODO DAVID
        self.leverage_rate = self.ratio(data["total_liabilities"], data["stockholders_equity"][0])
        self.net_debt_ebitda = None if data["total_liabilities"] is None or data["cash"] is None else self.ratio(data["total_liabilities"] - data["cash"], data["ebitda_ltm"][0])
        self.ebitda_liability = self.ratio(data["ebitda_ltm"][0], data["financial_liability_total"]) # TODO DAVID
        self.ebitda_financial_liability = self.ratio(data["ebitda_ltm"][0], data["financial_liability_total"])
        self.sales_evolution = self.ratio(data["sales_ltm"][0] - data["sales_ltm"][1], data["sales_ltm"][1])
        self.ebitda_evolution = self.ratio(data["ebitda_ltm"][0] - data["ebitda_ltm"][1], data["ebitda_ltm"][1])
        self.available_balance = None if data["credit_balance_active_bureau"] is None or data["actual_delay"] is None else data["credit_balance_active_bureau"] - data["actual_delay"]

        end_time = time.monotonic()
        self.exec_time = format(timedelta(seconds=end_time - start_time))

        # TODO translate fields names
        logger.logTo(self.id_naira, f'Duration: {timedelta(seconds=end_time - start_time)}', self.__class__.__name__)
        logger.logTo(self.id_naira, f'Ending reporting calculations', self.__class__.__name__)

    def ratio(self, var1, var2):
        try:
            return var1 / var2
        except:
            return None
from api import db
from utils.Logger import Logger
import time
from datetime import datetime, timedelta
import json

logger = Logger('logs')

class Factoring:

    def __init__(self, cap, ):

        self.cap = cap
        self.id_naira = id_naira

        # Qualitative
        self.net_utility_ltm = net_utility_ltm
        self.equity_last_3_years = equity_last_3_years
        self.sales_ltm = sales_ltm
        self.financial_liability_total = financial_liability_total
        self.cash = cash
        self.ebitda_ltm = ebitda_ltm
        self.operation_flow = operation_flow
        self.total_assets = total_assets
        self.stockholders_equity = stockholders_equity
        self.credit_balance_active_bureau = credit_balance_active_bureau
        self.paydex_12 = paydex_12
        self.deliquency_score = deliquency_score
        self.cessation_score = cessation_score
        self.viability_score = viability_score
        self.wallet_comparison = wallet_comparison
        self.company_profile = company_profile
        self.total_liabilities = total_liabilities
        self.free_cashflow = free_cashflow
        self.warranty_type = warranty_type
        self.warranty_value = warranty_value

        # Quantitative
        self.monex_payment_experience = monex_payment_experience
        self.actual_delay = actual_delay
        self.max_delays_12m = max_delays_12m
        self.days_delay = days_delay
        self.amount_delay = amount_delay
        self.legal_events = legal_events
        self.data_intensity = data_intensity
        self.invoices = invoices
        self.line_max_calculation = line_max_calculation

        # CMA
        self.government_dependencies = government_dependencies
        self.economic_activity = economic_activity
        self.warranties = warranties
        self.esg = esg
        self.current_asssets = current_asssets
        self.current_liabilities = current_liabilities
        self.exchange_op = exchange_op
        self.factoring = factoring

        # Limits


        # Reporting
        self.active_credits = active_credits
        self.default_29 = default_29
        self.default_59 = default_59
        self.default_89 = default_89
        self.default_119 = default_119
        self.default_179 = default_179
        self.default_more = default_more
        self.breaks = breaks
        self.restructures = restructures
        self.var_1m_debt = var_1m_debt
        self.var_1y_debt = var_1y_debt
        self.bureau_alert = bureau_alert
        self.endorsement_1 = endorsement_1
        self.endorsement_2 = endorsement_2
        self.endorsement_3 = endorsement_3

        # Calculated data

        self.score_paydex = 0
        self.score_deliquency = 0
        self.score_cessation = 0
        self.score_viability = 0
        self.score_comparisson = 0
        self.score_company = 0

        self.score_quantitative = 0

        self.payment_behaviour = 0
        self.score_payment_behaviour = 0
        self.score_days_delay = 0

        self.score_qualitative = 0

        #CMA variables
        self.score_legal_events = ""
        self.score_data_intensity = ""
        self.score_days_delays = ""


    def to_dict(self):
        return {
            'naira_id': self.id_naira,

            'net_utility_ltm': self.net_utility_ltm,
            'equity_last_3_years': self.equity_last_3_years,
            'sales_ltm': self.sales_ltm,
            'financial_liability_total': self.financial_liability_total,
            'cash': self.cash,
            'ebitda_ltm': self.ebitda_ltm,
            'operation_flow': self.operation_flow,
            'total_assets': self.total_assets,
            'stockholders_equity': self.stockholders_equity,
            'credit_balance_active_bureau': self.credit_balance_active_bureau,
            'paydex_12': self.paydex_12,
            'deliquency_score': self.deliquency_score,
            'cessation_score': self.cessation_score,
            'viability_score': self.viability_score,
            'wallet_comparison': self.wallet_comparison,
            'company_profile': self.company_profile,
            'total_liabilities': self.total_liabilities,
            'free_cashflow': self.free_cashflow,
            'warranty_type': self.warranty_type,
            'warranty_value': self.warranty_value,
            'monex_payment_experience': self.monex_payment_experience,
            'actual_delay': self.actual_delay,
            'max_delays_12m': self.max_delays_12m,
            'days_delay': self.days_delay,
            'amount_delay': self.amount_delay,
            'legal_events': self.legal_events,
            'data_intensity': self.data_intensity,
            'invoices': self.invoices,
            'line_max_calculation': self.line_max_calculation,
            'government_dependencies': self.government_dependencies,
            'economic_activity': self.economic_activity,
            'warranties': self.warranties,
            'esg': self.esg,
            'current_asssets': self.current_asssets,
            'current_liabilities': self.current_liabilities,
            'exchange_op': self.exchange_op,
            'factoring': self.factoring,
            'active_credits': self.active_credits,
            'default_29': self.default_29,
            'default_59': self.default_59,
            'default_89': self.default_89,
            'default_119': self.default_119,
            'default_179': self.default_179,
            'default_more': self.default_more,
            'breaks': self.breaks,
            'restructures': self.restructures,
            'var_1m_debt': self.var_1m_debt,
            'var_1y_debt': self.var_1y_debt,
            'bureau_alert': self.bureau_alert,
            'endorsement_1': self.endorsement_1,
            'endorsement_2': self.endorsement_2,
            'endorsement_3': self.endorsement_3,
            'score_paydex': self.score_paydex,
            'score_deliquency': self.score_deliquency,
            'score_cessation': self.score_cessation,
            'score_viability': self.score_viability,
            'score_comparisson': self.score_comparisson,
            'score_company': self.score_company,
            'score_quantitative': self.score_quantitative,
            'payment_behaviour': self.payment_behaviour,
            'score_payment_behaviour': self.score_payment_behaviour,
            'score_days_delay': self.score_days_delay,
            'score_qualitative': self.score_qualitative,
            'score_legal_events': self.score_legal_events,
            'score_data_intensity': self.score_data_intensity,
            'score_days_delays': self.score_days_delays,


            'exec_time': self.exec_time,
        }

    def execute(self):
        start_time = time.monotonic()

        logger.logTo(self.id_naira, f'Getting creditApplication data', self.__class__.__name__)

        # payment_behaviour
        self.payment_behaviour = None if self.credit_balance_active_bureau is None or self.credit_balance_active_bureau == 0 else self.amount_delay / self.credit_balance_active_bureau

        end_time = time.monotonic()
        self.exec_time = format(timedelta(seconds=end_time - start_time))

        logger.logTo(self.id_naira, f'Duración: {timedelta(seconds=end_time - start_time)}', self.__class__.__name__)
        logger.logTo(self.id_naira, f'Finalizando procesamiento de cálculo de Traditional', self.__class__.__name__)

    def __calculate_ratio(self, value1, value2):
        if value2 == 0:
            return 0
        return value1 / value2

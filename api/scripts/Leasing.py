from api import db
from utils.Logger import Logger
import time
from datetime import datetime, timedelta
import json

logger = Logger('logs')

class Leasing:

    def __init__(self, cap, id_naira, anual_sales, net_utility_ltm, equity_last_3_years, sales_ltm, cash, ebitda_ltm,
        operation_flow, total_assets, stockholders_equity, max_bureau_line, credit_balance_active_bureau, anual_inferred_income,
        total_liabilities, free_cashflow, warranty_type, warranty_value, shareholder_experience, business_stability,
        monex_payment_experience, monex_client_antiquity, credit_antiquity, actual_delay, historic_delay,
        payment_bureau_behaviour, historic_behaviour, max_delays_12m, days_delay, amount_delay,
        profitability, observation_keys, esg, liquid_pledge, sum_wallet_more_31, active_credits,
        default_29, default_59, default_89, default_119, default_179, default_more, breaks,
        restructures, var_1m_debt, var_1y_debt, bureau_alert, endorsement_1, endorsement_2, endorsement_3):

        self.cap = cap
        self.id_naira = id_naira

        self.line_factor1 = 0.08
        self.line_factor2 = 0.6

        # Quantitative
        self.anual_sales = anual_sales
        self.net_utility_ltm = net_utility_ltm
        self.equity_last_3_years = equity_last_3_years
        self.sales_ltm = sales_ltm
        self.cash = cash
        self.ebitda_ltm = ebitda_ltm
        self.operation_flow = operation_flow
        self.total_assets = total_assets
        self.stockholders_equity = stockholders_equity
        self.max_bureau_line = max_bureau_line
        self.credit_balance_active_bureau = credit_balance_active_bureau
        self.anual_inferred_income = anual_inferred_income
        self.total_liabilities = total_liabilities
        self.free_cashflow = free_cashflow
        self.warranty_type = warranty_type
        self.warranty_value = warranty_value
        self.endorsement_1 = endorsement_1
        self.endorsement_2 = endorsement_2
        self.endorsement_3 = endorsement_3

        # Qualitative
        self.shareholder_experience = shareholder_experience
        self.business_stability = business_stability

        # Behaviour
        self.monex_payment_experience = monex_payment_experience
        self.monex_client_antiquity = monex_client_antiquity
        self.credit_antiquity = credit_antiquity
        self.actual_delay = actual_delay
        self.historic_delay = historic_delay
        self.payment_bureau_behaviour = payment_bureau_behaviour
        self.historic_behaviour = historic_behaviour
        self.max_delays_12m = max_delays_12m
        self.days_delay = days_delay
        self.amount_delay = amount_delay

        # CMA
        self.profitability = profitability
        self.observation_keys = observation_keys
        self.esg = esg
        self.liquid_pledge = liquid_pledge
        self.sum_wallet_more_31 = sum_wallet_more_31

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

        # Calculated data
        self.term_years = 0
        self.payment_capacity = 0
        self.adjusted_payment_capacity = 0
        self.adjusted_max_bureau_line = 0
        self.line_score = 0
        self.line_product = 3000000
        self.line_proposal_selection = 0
        self.line_proposal = 0
        self.line_proposal_final = 0
        self.leverage = 0
        self.score_leverage = 0
        self.score_quantitative = None
        self.score_operation_antiquity = 0
        self.score_shareholder_experience = 0
        self.score_business_stability = 0
        self.score_qualitative = None
        self.score_monex_payment_experience = 0
        self.score_antiquity_client = 0
        self.score_antiquity_no_client = 0
        self.score_credit_antiquity = 0
        self.score_payment_bureau_behaviour = 0
        self.score_historic_behaviour = 0
        self.actual_delay_amount = 0
        self.historic_delay_amount = 0
        self.relevant_delays = 0
        self.score_relevant_delays = 0
        self.line_proposal_max_bureau = 0
        self.score_credit_relevance = 0
        self.score_observation_keys = 0
        self.score_behaviour = 0

        #CMA variables
        self.score_anual_inferred_income = 0
        self.economic_sector_adjustment = ""
        self.score_economic_sector = 0
        self.score_esg = 0
        self.score_liquid_pledge = 0
        self.score_profitability = 0
        self.score_sum_wallet_more_31 = 0
        self.solvency = 0
        self.score_solvency = 0

    def to_dict(self):
        return {
            'naira_id': self.id_naira,

            'line_factor1': self.line_factor1,
            'line_factor2': self.line_factor2,

            'anual_sales': self.anual_sales,
            'net_utility_ltm': self.net_utility_ltm,
            'equity_last_3_years': self.equity_last_3_years,
            'sales_ltm': self.sales_ltm,
            'cash': self.cash,
            'ebitda_ltm': self.ebitda_ltm,
            'operation_flow': self.operation_flow,
            'total_assets': self.total_assets,
            'stockholders_equity': self.stockholders_equity,
            'max_bureau_line': self.max_bureau_line,
            'credit_balance_active_bureau': self.credit_balance_active_bureau,
            'anual_inferred_income': self.anual_inferred_income,
            'total_liabilities': self.total_liabilities,
            'free_cashflow': self.free_cashflow,
            'warranty_type': self.warranty_type,
            'warranty_value': self.warranty_value,
            'endorsement_1': self.endorsement_1,
            'endorsement_2': self.endorsement_2,
            'endorsement_3': self.endorsement_3,

            'shareholder_experience': self.shareholder_experience,
            'business_stability': self.business_stability,

            'monex_payment_experience': self.monex_payment_experience,
            'monex_client_antiquity': self.monex_client_antiquity,
            'credit_antiquity': self.credit_antiquity,
            'actual_delay': self.actual_delay,
            'historic_delay': self.historic_delay,
            'payment_bureau_behaviour': self.payment_bureau_behaviour,
            'historic_behaviour': self.historic_behaviour,
            'max_delays_12m': self.max_delays_12m,
            'days_delay': self.days_delay,
            'amount_delay': self.amount_delay,

            'profitability': self.profitability,
            'observation_keys': self.observation_keys,
            'esg': self.esg,
            'liquid_pledge': self.liquid_pledge,
            'sum_wallet_more_31': self.sum_wallet_more_31,

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

            'term_years': self.term_years,
            'payment_capacity': self.payment_capacity,
            'adjusted_payment_capacity': self.adjusted_payment_capacity,
            'adjusted_max_bureau_line': self.adjusted_max_bureau_line,
            'line_score': self.line_score,
            'line_proposal_selection': self.line_proposal_selection,
            'line_proposal': self.line_proposal,
            'line_proposal_final': self.line_proposal_final,
            'line_product': self.line_product,
            'leverage': self.leverage,
            'score_leverage': self.score_leverage,
            'score_quantitative': self.score_quantitative,
            'score_operation_antiquity': self.score_operation_antiquity,
            'score_shareholder_experience': self.score_shareholder_experience,
            'score_business_stability': self.score_business_stability,
            'score_qualitative': self.score_qualitative,
            'score_monex_payment_experience': self.score_monex_payment_experience,
            'score_antiquity_client': self.score_antiquity_client,
            'score_antiquity_no_client': self.score_antiquity_no_client,
            'score_credit_antiquity': self.score_credit_antiquity,
            'score_payment_bureau_behaviour': self.score_payment_bureau_behaviour,
            'score_historic_behaviour': self.score_historic_behaviour,
            'actual_delay_amount': self.actual_delay_amount,
            'historic_delay_amount': self.historic_delay_amount,
            'relevant_delays': self.relevant_delays,
            'score_relevant_delays': self.score_relevant_delays,
            'line_proposal_max_bureau': self.line_proposal_max_bureau,
            'score_credit_relevance': self.score_credit_relevance,
            'score_observation_keys': self.score_observation_keys,
            'score_behaviour': self.score_behaviour,
            'score_anual_inferred_income': self.score_anual_inferred_income,
            'economic_sector_adjustment': self.economic_sector_adjustment,
            'score_economic_sector': self.score_economic_sector,
            'score_esg': self.score_esg,
            'score_liquid_pledge': self.score_liquid_pledge,
            'score_profitability': self.score_profitability,
            'score_sum_wallet_more_31': self.score_sum_wallet_more_31,
            'solvency': self.solvency,
            'score_solvency': self.score_solvency,

            'exec_time': self.exec_time,
        }

    def execute(self):
        start_time = time.monotonic()

        logger.logTo(self.id_naira, f'Getting creditApplication data', self.__class__.__name__)

        self.term_years = self.cap.term_months / 12
        self.payment_capacity = 0 if self.anual_inferred_income	- self.credit_balance_active_bureau < 0 else (self.anual_inferred_income - self.credit_balance_active_bureau) * self.term_years

        self.adjusted_payment_capacity = self.payment_capacity * self.line_factor1
        self.adjusted_max_bureau_line = self.max_bureau_line * self.line_factor2
        self.line_score = min(max(0, self.payment_capacity), max(0, self.adjusted_max_bureau_line))
        self.line_proposal_selection = "Sin línea" if self.line_score == 0 else ("capacidad" if self.line_score == self.adjusted_payment_capacity else "buró")

        # line_proposal_final
        self.line_proposal = min(self.line_score, self.line_product)

        if self.line_proposal == 0:
            self.line_proposal_final = "sin línea"
        elif self.line_proposal == self.adjusted_payment_capacity:
            self.line_proposal_final = "capacidad"
        elif self.line_proposal == self.adjusted_max_bureau_line:
            self.line_proposal_final = "buró"
        elif self.line_proposal == self.line_product:
            self.line_proposal_final = "línea producto"


        self.leverage = (self.credit_balance_active_bureau + self.line_proposal)/(self.anual_inferred_income/12) if self.anual_inferred_income != 0 else None

        # score_antiquity_client
        if self.credit_antiquity< 0.5:
            self.score_antiquity_client = 0
        elif self.credit_antiquity == 0.5:
            self.score_antiquity_client = 2
        elif self.credit_antiquity < 0.8:
            self.score_antiquity_client = 4
        elif self.credit_antiquity < 1:
            self.score_antiquity_client = 6
        elif self.credit_antiquity < 1.5:
            self.score_antiquity_client = 8
        else:
            self.score_antiquity_client = 10

        # score_antiquity_no_client
        if self.credit_antiquity< 0.5:
            self.score_antiquity_no_client = 0
        elif self.credit_antiquity == 0.5:
            self.score_antiquity_no_client = 2
        elif self.credit_antiquity < 1:
            self.score_antiquity_no_client = 4
        elif self.credit_antiquity < 2:
            self.score_antiquity_no_client = 6
        elif self.credit_antiquity < 3:
            self.score_antiquity_no_client = 8
        else:
            self.score_antiquity_no_client = 10

        # score_credit_antiquity
        if self.cap.is_client:
            self.score_credit_antiquity = self.score_antiquity_client
        else:
            self.score_credit_antiquity = self.score_antiquity_no_client

        self.actual_delay_amount = self.actual_delay / self.max_bureau_line if self.max_bureau_line is not None else None
        self.historic_delay_amount = self.historic_delay / self.max_bureau_line if self.max_bureau_line is not None else None
        self.relevant_delays = max(self.actual_delay_amount, self.historic_delay_amount)

        self.line_proposal_max_bureau = self.line_proposal / self.max_bureau_line if self.max_bureau_line is not None else 0

        # score_anual_inferred_income
        if self.anual_inferred_income<=5000000:
            self.score_anual_inferred_income = "-"
        elif self.anual_inferred_income<=10000000:
            self.score_anual_inferred_income = "?"
        else:
            self.score_anual_inferred_income = "="

        # economic_sector_adjustment
        self.economic_sector_adjustment = ""
        with open('resources/sectors.json', encoding='utf-8') as file:
            sectors = json.load(file)
            self.economic_sector_adjustment = sectors[self.cap.economic_sector]

        # score_economic_sector
        if self.economic_sector_adjustment == "No Deseable":
            self.score_economic_sector = "?"
        if self.economic_sector_adjustment == "No Acreditable":
            self.score_economic_sector = "-"
        else:
            self.score_economic_sector = "="

        # score_esg
        self.score_esg = "+" if self.esg == "Prácticas ESG" else "="

        # score_liquid_pledge
        self.score_liquid_pledge = "+" if self.liquid_pledge == "Sí" else "="

        # score_profitability
        self.score_profitability = "+" if self.monex_client_antiquity >= 10 and self.profitability >= 10000 else "="

        # score_sum_wallet_more_31
        self.score_sum_wallet_more_31 = "-" if self.sum_wallet_more_31 >= 0.2 else ("?" if self.sum_wallet_more_31 >= 0.1 else "=")

        # solvency
        self.solvency = 0 if self.warranty_value == 0 and self.line_proposal == 0 else self.warranty_value / self.line_proposal

        # score_solvency
        self.score_solvency = "+" #TODO DAVID check formula

        end_time = time.monotonic()
        self.exec_time = format(timedelta(seconds=end_time - start_time))

        # TODO translate fields names
        logger.logTo(self.id_naira, f'Duración: {timedelta(seconds=end_time - start_time)}', self.__class__.__name__)
        logger.logTo(self.id_naira, f'Finalizando procesamiento de cálculo de Leasing', self.__class__.__name__)

    def __calculate_ratio(self, value1, value2):
        if value2 == 0:
            return 0
        return value1 / value2

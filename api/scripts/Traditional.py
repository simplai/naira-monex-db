from api import db
from models.PymeTraditionalIndicatorsModel import PymeTraditionalIndicator
from utils.Logger import Logger
import time
from datetime import datetime, timedelta
from statistics import mean
import json

logger = Logger('logs')

class Traditional:

    def __init__(self, cap, id_naira, net_utility_ltm, equity_last_3_years, sales_ltm, financial_liability_total, cash, ebitda_ltm,
        sales_cost, operation_expenses, financial_expenses_ltm, operation_flow, debt_payable, taxes_payable,
        taxes_receivable, debt_short, debt_long, inventories, accounts_receivable, total_assets, expired_wallet,
        total_wallet, stockholders_equity, admin_expenses, properties_and_equipment, max_bureau_line,
        credit_balance_active_bureau, assets_long, liabilities_long, total_liabilities, free_cashflow,
        warranty_type, warranty_value, shareholder_experience, business_stability, monex_payment_experience,
        monex_client_antiquity, past_due_avg_days, credit_antiquity, actual_delay, payment_bureau_behaviour, max_delays_12m,
        days_delay, amount_delay, government_dependencies, economic_activity, warranties, esg, current_asssets,
        current_liabilities, exchange_op, factoring, basic_equity, active_credits, default_29, default_59,
        default_89, default_119, default_179, default_more, breaks, restructures, var_1m_debt, var_1y_debt,
        bureau_alert, endorsement_1, endorsement_2, endorsement_3):

        self.cap = cap
        self.id_naira = id_naira

        # Line factors
        self.line_factor1 = 0.6
        self.line_factor2 = 0.3
        self.line_factor3 = 0.08
        self.line_factor4 = 0.33
        self.line_factor5 = 0.08
        self.product_limit = 20000000

        self.term_years = cap.term_months / 12

        # Qualitative
        self.net_utility_ltm = net_utility_ltm
        self.equity_last_3_years = equity_last_3_years
        self.sales_ltm = sales_ltm
        self.financial_liability_total = financial_liability_total
        self.cash = cash
        self.ebitda_ltm = ebitda_ltm
        self.sales_cost = sales_cost
        self.operation_expenses = operation_expenses
        self.financial_expenses_ltm = financial_expenses_ltm
        self.operation_flow = operation_flow
        self.debt_payable = debt_payable
        self.taxes_payable = taxes_payable
        self.taxes_receivable = taxes_receivable
        self.debt_short = debt_short
        self.debt_long = debt_long
        self.inventories = inventories
        self.accounts_receivable = accounts_receivable
        self.total_assets = total_assets
        self.expired_wallet = expired_wallet
        self.total_wallet = total_wallet
        self.stockholders_equity = stockholders_equity
        self.admin_expenses = admin_expenses
        self.properties_and_equipment = properties_and_equipment
        self.max_bureau_line = max_bureau_line
        self.credit_balance_active_bureau = credit_balance_active_bureau
        self.assets_long = assets_long
        self.liabilities_long = liabilities_long
        self.total_liabilities = total_liabilities
        self.free_cashflow = free_cashflow
        self.warranty_type = warranty_type
        self.warranty_value = warranty_value

        # Quantitative
        self.shareholder_experience = shareholder_experience
        self.business_stability = business_stability

        # Behaviour
        self.monex_payment_experience = monex_payment_experience
        self.monex_client_antiquity = monex_client_antiquity
        self.credit_antiquity = credit_antiquity
        self.past_due_avg_days = past_due_avg_days
        self.actual_delay = actual_delay
        self.payment_bureau_behaviour = payment_bureau_behaviour
        self.max_delays_12m = max_delays_12m
        self.days_delay = days_delay
        self.amount_delay = amount_delay

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
        self.basic_equity = basic_equity

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


        self.sales_evolution = 0
        self.score_sales_evolution = 0
        self.roes = []
        self.avg_roe = 0
        self.score_avg_roe = 0
        self.net_margins = []
        self.avg_net_margins = 0
        self.score_avg_net_margins = 0
        self.financial_debt_net = 0
        self.financial_debt_ebitda = 0
        self.score_financial_debt_ebitda = 0
        self.interest_coverage = 0
        self.score_interest_coverage = 0
        self.total_finacial_debt = 0
        self.cash_flow = 0
        self.score_cash_flow = 0
        self.days_accounts_payable = 0
        self.accounts_payable_90d = 0
        self.days_accounts_receivable = 0
        self.accounts_receivable_90d = 0
        self.adjusted_working_equity = 0
        self.score_adjusted_working_equity = 0
        self.inventory_days = 0
        self.cash_cycle = 0
        self.score_cash_cycle = 0
        self.assets_rotation = 0
        self.score_assets_rotation = 0

        self.score_quantitative = 0

        self.score_operation_antiquity = 0
        self.score_shareholder_experience = 0
        self.score_business_stability = 0

        self.score_qualitative = 0

        self.score_monex_payment_experience = 0
        self.score_antiquity_client = 0
        self.score_antiquity_no_client = 0
        self.score_credit_antiquity = 0
        self.score_max_delays_12m = 0
        self.score_past_due_avg_days = 0

        self.score_behaviour = 0

        #CMA variables
        self.adjusted_payment_bureau_behaviour = "="
        self.score_payment_bureau_behaviour = "="
        self.score_operation_antiquity_rule = "="
        self.economic_activity_adjustment = "="
        self.score_economic_activity = "="
        self.score_warranties = "="
        self.profitability = "="
        self.score_profitability = "="
        self.score_government_dependencies = "="
        self.score_esg = "="
        self.property_solvency = "="
        self.score_property_solvency = "="
        self.exchange_op_liquity = "="
        self.score_exchange_op = "="
        self.wallet_quality = "="
        self.score_factoring = "="

        # Line variables
        self.adjusted_max_bureau_line = 0
        self.adjusted_avg_equity = 0
        self.adjusted_sales_ltm = 0
        self.adjusted_payment_capacity = 0
        self.adjusted_equity = 0
        self.line_granted = 0
        self.mean_stockholders_equity = 0
        self.mean_sales_ltm = 0
        self.mean_payment_capacity = 0

    def to_dict(self):
        return {
            'naira_id': self.id_naira,

            'line_factor1': self.line_factor1,
            'line_factor2': self.line_factor2,
            'line_factor3': self.line_factor3,
            'line_factor4': self.line_factor4,
            'line_factor5': self.line_factor5,
            'product_limit': self.product_limit,

            'net_utility_ltm': self.net_utility_ltm,
            'equity_last_3_years': self.equity_last_3_years,
            'sales_ltm': self.sales_ltm,
            'financial_liability_total': self.financial_liability_total,
            'cash': self.cash,
            'ebitda_ltm': self.ebitda_ltm,
            'sales_cost': self.sales_cost,
            'operation_expenses': self.operation_expenses,
            'financial_expenses_ltm': self.financial_expenses_ltm,
            'operation_flow': self.operation_flow,
            'debt_payable': self.debt_payable,
            'taxes_payable': self.taxes_payable,
            'taxes_receivable': self.taxes_receivable,
            'debt_short': self.debt_short,
            'debt_long': self.debt_long,
            'inventories': self.inventories,
            'accounts_receivable': self.accounts_receivable,
            'total_assets': self.total_assets,
            'expired_wallet': self.expired_wallet,
            'total_wallet': self.total_wallet,
            'stockholders_equity': self.stockholders_equity,
            'admin_expenses': self.admin_expenses,
            'properties_and_equipment': self.properties_and_equipment,
            'max_bureau_line': self.max_bureau_line,
            'credit_balance_active_bureau': self.credit_balance_active_bureau,
            'assets_long': self.assets_long,
            'liabilities_long': self.liabilities_long,
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
            'past_due_avg_days': self.past_due_avg_days,
            'actual_delay': self.actual_delay,
            'payment_bureau_behaviour': self.payment_bureau_behaviour,
            'max_delays_12m': self.max_delays_12m,
            'days_delay': self.days_delay,
            'amount_delay': self.amount_delay,
            'government_dependencies': self.government_dependencies,
            'economic_activity': self.economic_activity,
            'warranties': self.warranties,
            'esg': self.esg,
            'current_asssets': self.current_asssets,
            'current_liabilities': self.current_liabilities,
            'exchange_op': self.exchange_op,
            'factoring': self.factoring,
            'basic_equity': self.basic_equity,
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
            'sales_evolution': self.sales_evolution,
            'score_sales_evolution': self.score_sales_evolution,
            'roes': self.roes,
            'avg_roe': self.avg_roe,
            'score_avg_roe': self.score_avg_roe,
            'net_margins': self.net_margins,
            'avg_net_margins': self.avg_net_margins,
            'score_avg_net_margins': self.score_avg_net_margins,
            'financial_debt_net': self.financial_debt_net,
            'financial_debt_ebitda': self.financial_debt_ebitda,
            'score_financial_debt_ebitda': self.score_financial_debt_ebitda,
            'interest_coverage': self.interest_coverage,
            'score_interest_coverage': self.score_interest_coverage,
            'total_finacial_debt': self.total_finacial_debt,
            'cash_flow': self.cash_flow,
            'score_cash_flow': self.score_cash_flow,
            'days_accounts_payable': self.days_accounts_payable,
            'accounts_payable_90d': self.accounts_payable_90d,
            'days_accounts_receivable': self.days_accounts_receivable,
            'accounts_receivable_90d': self.accounts_receivable_90d,
            'adjusted_working_equity': self.adjusted_working_equity,
            'score_adjusted_working_equity': self.score_adjusted_working_equity,
            'inventory_days': self.inventory_days,
            'cash_cycle': self.cash_cycle,
            'score_cash_cycle': self.score_cash_cycle,
            'assets_rotation': self.assets_rotation,
            'score_assets_rotation': self.score_assets_rotation,
            'score_quantitative': self.score_quantitative,
            'score_operation_antiquity': self.score_operation_antiquity,
            'score_shareholder_experience': self.score_shareholder_experience,
            'score_business_stability': self.score_business_stability,
            'score_qualitative': self.score_qualitative,
            'score_monex_payment_experience': self.score_monex_payment_experience,
            'score_antiquity_client': self.score_antiquity_client,
            'score_antiquity_no_client': self.score_antiquity_no_client,
            'score_credit_antiquity': self.score_credit_antiquity,
            'score_max_delays_12m': self.score_max_delays_12m,
            'score_past_due_avg_days': self.score_past_due_avg_days,
            'score_behaviour': self.score_behaviour,
            'adjusted_payment_bureau_behaviour': self.adjusted_payment_bureau_behaviour,
            'score_payment_bureau_behaviour': self.score_payment_bureau_behaviour,
            'score_operation_antiquity_rule': self.score_operation_antiquity_rule,
            'economic_activity_adjustment': self.economic_activity_adjustment,
            'profitability': self.profitability,
            'score_profitability': self.score_profitability,
            'score_government_dependencies': self.score_government_dependencies,
            'score_esg': self.score_esg,
            'property_solvency': self.property_solvency,
            'score_property_solvency': self.score_property_solvency,
            'exchange_op_liquity': self.exchange_op_liquity,
            'score_exchange_op': self.score_exchange_op,
            'score_warranties': self.score_warranties,
            'score_economic_activity': self.score_economic_activity,
            'mean_stockholders_equity': self.mean_stockholders_equity,
            'mean_sales_ltm': self.mean_sales_ltm,
            'mean_payment_capacity': self.mean_payment_capacity,
            'wallet_quality': self.wallet_quality,
            'score_factoring': self.score_factoring,

            'adjusted_max_bureau_line': self.adjusted_max_bureau_line,
            'adjusted_avg_equity': self.adjusted_avg_equity,
            'adjusted_sales_ltm': self.adjusted_sales_ltm,
            'adjusted_payment_capacity': self.adjusted_payment_capacity,
            'adjusted_equity': self.adjusted_equity,
            'line_granted': self.line_granted,

            'exec_time': self.exec_time,
        }

    def execute(self):
        start_time = time.monotonic()

        logger.logTo(self.id_naira, f'Getting creditApplication data', self.__class__.__name__)

        self.sales_evolution = -0.12 # TODO DAVID set function

        # avg_roe
        roe_factors = [0.5, 0.3, 0.2, 0, 0]

        sum_factors = 0
        sum_values = 0
        for i in range(5):
            self.roes.append(None if self.net_utility_ltm[i] is None or self.stockholders_equity[i] is None else self.net_utility_ltm[i] / self.stockholders_equity[i])
            if self.roes[i] is None:
                break
            sum_values = sum_values + (roe_factors[i] * self.roes[i])
            sum_factors = sum_factors + roe_factors[i]

        self.avg_roe = None if sum_factors == 0 else sum_values / sum_factors

        # avg_net_margins
        margins_factors = [0.5, 0.3, 0.2, 0, 0]

        sum_factors = 0
        sum_values = 0
        for i in range(5):
            self.net_margins.append(None if self.net_utility_ltm[i] is None or self.sales_ltm[i] is None else self.net_utility_ltm[i] / self.sales_ltm[i])
            if self.net_margins[i] is None:
                break
            sum_values = sum_values + (margins_factors[i] * self.net_margins[i])
            sum_factors = sum_factors + margins_factors[i]

        self.avg_net_margins = None if sum_factors == 0 else sum_values / sum_factors

        # financial_debt_ebitda
        self.financial_debt_net = self.financial_liability_total - self.cash
        self.financial_debt_ebitda = None if self.ebitda_ltm[0] is None or self.ebitda_ltm[0] == 0 else self.financial_debt_net / self.ebitda_ltm[0]

        # interest_coverage
        self.interest_coverage = None if self.ebitda_ltm[0] is None or self.financial_expenses_ltm[0] is None else self.ebitda_ltm[0] / self.financial_expenses_ltm[0]

        # cash_flow
        self.total_finacial_debt = self.debt_short + self.debt_long
        self.cash_flow = None if self.total_finacial_debt == 0 else self.operation_flow / self.total_finacial_debt

        # adjusted_working_equity
        self.days_accounts_payable = None if max(self.sales_cost, self.operation_expenses[0]) == 0 else self.debt_payable / (max(self.sales_cost, self.operation_expenses[0]) / 360)
        self.accounts_payable_90d = None if self.days_accounts_payable is None or self.days_accounts_payable == 0 else self.debt_payable / self.days_accounts_payable * 90
        self.days_accounts_receivable = None if self.sales_ltm[0] is None or self.sales_ltm[0] == 0 else self.accounts_receivable / (self.sales_ltm[0] / 360)
        self.accounts_receivable_90d = None if  self.days_accounts_receivable is None or self.days_accounts_receivable == 0 else self.accounts_receivable / self.days_accounts_receivable

        if self.sales_cost == 0:
            self.adjusted_working_equity = 0
        else:
            self.adjusted_working_equity = None if self.debt_short is None or self.debt_short == 0 else (self.cash + self.accounts_receivable_90d - self.accounts_payable_90d - self.taxes_payable + self.taxes_receivable) / self.debt_short

        # cash_cycle
        self.inventory_days = None if max(self.sales_cost, self.operation_expenses[0]) == 0 else self.inventories / (max(self.sales_cost, self.operation_expenses[0]) / 360)
        self.cash_cycle = None if self.sales_cost == 0 else self.inventory_days + self.days_accounts_receivable - self.days_accounts_payable

        # assets_rotation
        self.assets_rotation = None if self.total_assets is None or self.total_assets == 0 else self.sales_ltm[0] / self.total_assets

        # score_antiquity_client # TODO check discretizations
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


        # adjusted_payment_bureau_behaviour
        if self.payment_bureau_behaviour == "MOP 1" or self.payment_bureau_behaviour == "MOP 2":
            self.adjusted_payment_bureau_behaviour = "Atrasos poco relevantes"
            self.score_payment_bureau_behaviour = "="
        elif self.payment_bureau_behaviour == "MOP 3" or self.payment_bureau_behaviour == "Mayor o igual a MOP 4":
            self.adjusted_payment_bureau_behaviour = "MOP 3 o más | Atrasos, reestructuras, quitas."
            score_payment_bureau_behaviour = "-"
        elif self.payment_bureau_behaviour == "Sin información":
            self.adjusted_payment_bureau_behaviour = "Sin información"
            score_payment_bureau_behaviour = "="
        elif self.payment_bureau_behaviour == "N/A" or self.payment_bureau_behaviour == None:
            self.adjusted_payment_bureau_behaviour = None
            score_payment_bureau_behaviour = None
        elif self.payment_bureau_behaviour == "":
            self.adjusted_payment_bureau_behaviour = "Pago siempre puntual"
            score_payment_bureau_behaviour = "?"

        if self.cap.operation_antiquity <= 3:
            self.score_operation_antiquity_rule == "-"
        else:
            self.score_operation_antiquity_rule == "="

        # economic_activity_adjustment
        with open('resources/sectors.json', encoding='utf-8') as file:
            sectors = json.load(file)
            self.economic_activity_adjustment = sectors[self.economic_activity]

        # score_economic_activity
        if self.economic_activity_adjustment == "No Deseable":
            self.score_economic_activity = "?"
        elif self.economic_activity_adjustment == "No Acreditable":
            self.score_economic_activity = "-"
        else:
            self.score_economic_activity = "="

        # profitability
        self.profitability = "Pérdida en 2 ejercicios" #TODO DAVID function

        if self.profitability == "Pérdida en 2 ejercicios":
            self.score_profitability == "?"
        elif self.profitability == "Pérdidas en más de 2 ejercicios":
            self.score_profitability == "-"
        else:
            self.score_profitability == "="

        # Government Dependencies
        self.score_government_dependencies = "?" if self.government_dependencies == "Principal proveedor o cliente es Gobierno" else "="

        # Warranties
        self.score_warranties = "+" if self.warranties == "Aforos por tipo de garantías (Manual de Crédito)" else "="

        # score_esg
        self.score_esg = "+" if self.esg == "Prácticas ESG" else "="

        # property_solvency
        self.property_solvency = None if self.properties_and_equipment is None or self.properties_and_equipment == 0 else self.cap.requested_amount / self.properties_and_equipment

        self.score_property_solvency = "+" if self.property_solvency >= 2 else "="

        # exchange_op_liquity
        self.exchange_op_liquity = 0 if self.current_liabilities == None or self.current_liabilities == 0 else self.current_asssets/ self.current_liabilities

        self.score_exchange_op = "-" if self.exchange_op == "Sí" and self.exchange_op_liquity >= 1 else "="

        # score_factoring
        self.wallet_quality = 0 if self.total_wallet is None or self.total_wallet == 0 else self.expired_wallet / self.total_wallet
        if self.factoring == "No":
            self.score_factoring = "="
        elif self.wallet_quality > 0.2:
            self.score_factoring = "-"

        end_time = time.monotonic()
        self.exec_time = format(timedelta(seconds=end_time - start_time))

        # TODO translate fields names
        logger.logTo(self.id_naira, f'Duración: {timedelta(seconds=end_time - start_time)}', self.__class__.__name__)
        logger.logTo(self.id_naira, f'Finalizando procesamiento de cálculo de Traditional', self.__class__.__name__)

    def line_calculation(self, factor):
        self.adjusted_max_bureau_line = self.max_bureau_line * self.line_factor1
        self.mean_stockholders_equity = mean(self.stockholders_equity)

        self.adjusted_avg_equity = mean(self.stockholders_equity) * self.line_factor2
        self.mean_sales_ltm = mean(self.sales_ltm)
        self.adjusted_sales_ltm = mean(self.sales_ltm) * self.line_factor3
        self.mean_payment_capacity = mean(self.ebitda_ltm) - mean(self.financial_expenses_ltm)
        self.adjusted_payment_capacity = self.mean_payment_capacity * self.term_years *self.line_factor4
        self.adjusted_equity = self.basic_equity # TODO DAVID factor???

        self.line_granted = min(self.adjusted_max_bureau_line, self.adjusted_avg_equity, self.adjusted_sales_ltm, self.adjusted_payment_capacity, self.adjusted_equity) * factor


        model = PymeTraditionalIndicator.query.filter_by(naira_id=self.id_naira).first()

        setattr(model, "adjusted_max_bureau_line", self.adjusted_max_bureau_line)
        setattr(model, "mean_stockholders_equity", self.mean_stockholders_equity)
        setattr(model, "adjusted_avg_equity", self.adjusted_avg_equity)
        setattr(model, "mean_sales_ltm", self.mean_sales_ltm)
        setattr(model, "adjusted_sales_ltm", self.adjusted_sales_ltm)
        setattr(model, "mean_payment_capacity", self.mean_payment_capacity)
        setattr(model, "adjusted_payment_capacity", self.adjusted_payment_capacity)
        setattr(model, "adjusted_equity", self.adjusted_equity)
        setattr(model, "line_granted", self.line_granted)

        return self.line_granted

    def __calculate_ratio(self, value1, value2):
        if value2 == 0:
            return 0
        return value1 / value2

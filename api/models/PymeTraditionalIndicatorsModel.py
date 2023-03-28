from api import db


class PymeTraditionalIndicator(db.Model):

    def __repr__(self):
        return '<PymeTraditionalIndicator %r>' % self.naira_id

    __tablename__ = "pyme_traditional_indicator"
    id = db.Column(db.Integer, primary_key=True)
    naira_id = db.Column(db.Integer, db.ForeignKey('creditapplication.id'), nullable=False)

    # Qualitative
    net_utility_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    equity_last_3_years = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    sales_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    financial_liability_total = db.Column(db.Float, unique=False, nullable=True)
    cash = db.Column(db.Float, unique=False, nullable=True)
    ebitda_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    sales_cost = db.Column(db.Float, unique=False, nullable=True)
    operation_expenses = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    financial_expenses_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    operation_flow = db.Column(db.Float, unique=False, nullable=True)
    debt_payable = db.Column(db.Float, unique=False, nullable=True)
    taxes_payable = db.Column(db.Float, unique=False, nullable=True)
    taxes_receivable = db.Column(db.Float, unique=False, nullable=True)
    debt_short = db.Column(db.Float, unique=False, nullable=True)
    debt_long = db.Column(db.Float, unique=False, nullable=True)
    inventories = db.Column(db.Float, unique=False, nullable=True)
    accounts_receivable = db.Column(db.Float, unique=False, nullable=True)
    total_assets = db.Column(db.Float, unique=False, nullable=True)
    expired_wallet = db.Column(db.Float, unique=False, nullable=True)
    total_wallet = db.Column(db.Float, unique=False, nullable=True)
    stockholders_equity = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    admin_expenses = db.Column(db.Float, unique=False, nullable=True)
    properties_and_equipment = db.Column(db.Float, unique=False, nullable=True)
    max_bureau_line = db.Column(db.Float, unique=False, nullable=True)
    credit_balance_active_bureau = db.Column(db.Float, unique=False, nullable=True)
    assets_long = db.Column(db.Float, unique=False, nullable=True)
    liabilities_long = db.Column(db.Float, unique=False, nullable=True)
    total_liabilities = db.Column(db.Float, unique=False, nullable=True)
    free_cashflow = db.Column(db.Float, unique=False, nullable=True)
    warranty_type = db.Column(db.String, unique=False, nullable=True)
    warranty_value = db.Column(db.Float, unique=False, nullable=True)

    score_qualitative = db.Column(db.Float, unique=False, nullable=True)

    # Quantitative
    shareholder_experience = db.Column(db.Integer, unique=False, nullable=True)
    business_stability = db.Column(db.Integer, unique=False, nullable=True)

    score_quantitative = db.Column(db.Float, unique=False, nullable=True)

    # Behaviour
    monex_payment_experience = db.Column(db.Integer, unique=False, nullable=True)
    monex_client_antiquity = db.Column(db.Integer, unique=False, nullable=True)
    credit_antiquity = db.Column(db.Integer, unique=False, nullable=True)
    past_due_avg_days = db.Column(db.Float, unique=False, nullable=True)
    credit_antiquity = db.Column(db.Float, unique=False, nullable=True)
    actual_delay = db.Column(db.Float, unique=False, nullable=True)
    payment_bureau_behaviour = db.Column(db.String, unique=False, nullable=True)
    max_delays_12m = db.Column(db.Integer, unique=False, nullable=True)
    days_delay = db.Column(db.Integer, unique=False, nullable=True)
    amount_delay = db.Column(db.Float, unique=False, nullable=True)

    score_behaviour = db.Column(db.Float, unique=False, nullable=True)

    # CMA
    government_dependencies = db.Column(db.String, unique=False, nullable=True)
    economic_activity = db.Column(db.String, unique=False, nullable=True)
    warranties = db.Column(db.String, unique=False, nullable=True)
    esg = db.Column(db.String, unique=False, nullable=True)
    current_asssets = db.Column(db.Float, unique=False, nullable=True)
    current_liabilities = db.Column(db.Float, unique=False, nullable=True)
    exchange_op = db.Column(db.String, unique=False, nullable=True)
    factoring = db.Column(db.String, unique=False, nullable=True)

    # Limits
    basic_equity = db.Column(db.Float, unique=False, nullable=True)

    # Reporting
    active_credits = db.Column(db.Integer, unique=False, nullable=True)
    default_29 = db.Column(db.Integer, unique=False, nullable=True)
    default_59 = db.Column(db.Integer, unique=False, nullable=True)
    default_89 = db.Column(db.Integer, unique=False, nullable=True)
    default_119 = db.Column(db.Integer, unique=False, nullable=True)
    default_179 = db.Column(db.Integer, unique=False, nullable=True)
    default_more = db.Column(db.Integer, unique=False, nullable=True)
    breaks = db.Column(db.Integer, unique=False, nullable=True)
    restructures = db.Column(db.Integer, unique=False, nullable=True)
    var_1m_debt = db.Column(db.Integer, unique=False, nullable=True)
    var_1y_debt = db.Column(db.Integer, unique=False, nullable=True)
    bureau_alert = db.Column(db.Integer, unique=False, nullable=True)
    endorsement_1 = db.Column(db.String, unique=False, nullable=True)
    endorsement_2 = db.Column(db.String, unique=False, nullable=True)
    endorsement_3 = db.Column(db.String, unique=False, nullable=True)

    # Aggregated
    sales_evolution = db.Column(db.Float, unique=False, nullable=True)
    score_sales_evolution = db.Column(db.Float, unique=False, nullable=True)
    roes = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    avg_roe = db.Column(db.Float, unique=False, nullable=True)
    score_avg_roe = db.Column(db.Float, unique=False, nullable=True)
    net_margins = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    avg_net_margins = db.Column(db.Float, unique=False, nullable=True)
    score_avg_net_margins = db.Column(db.Float, unique=False, nullable=True)
    financial_debt_net = db.Column(db.Float, unique=False, nullable=True)
    financial_debt_ebitda = db.Column(db.Float, unique=False, nullable=True)
    score_financial_debt_ebitda = db.Column(db.Float, unique=False, nullable=True)
    interest_coverage = db.Column(db.Float, unique=False, nullable=True)
    score_interest_converage = db.Column(db.Float, unique=False, nullable=True)
    cash_flow = db.Column(db.Float, unique=False, nullable=True)
    score_cash_flow = db.Column(db.Float, unique=False, nullable=True)
    days_accounts_payable = db.Column(db.Float, unique=False, nullable=True)
    accounts_payable_90d = db.Column(db.Float, unique=False, nullable=True)
    days_accounts_receivable = db.Column(db.Float, unique=False, nullable=True)
    accounts_receivable_90d = db.Column(db.Float, unique=False, nullable=True)
    adjusted_working_equity = db.Column(db.Float, unique=False, nullable=True)
    score_adjusted_working_equity = db.Column(db.Float, unique=False, nullable=True)
    inventory_days = db.Column(db.Float, unique=False, nullable=True)
    cash_cycle = db.Column(db.Float, unique=False, nullable=True)
    score_cash_cycle = db.Column(db.Float, unique=False, nullable=True)
    assets_rotation = db.Column(db.Float, unique=False, nullable=True)
    score_assets_rotation = db.Column(db.Float, unique=False, nullable=True)
    score_operation_antiquity = db.Column(db.Float, unique=False, nullable=True)
    score_shareholder_experience = db.Column(db.Float, unique=False, nullable=True)
    business_stability = db.Column(db.Float, unique=False, nullable=True)
    monex_payment_experience = db.Column(db.Float, unique=False, nullable=True)
    score_antiquity_client = db.Column(db.Float, unique=False, nullable=True)
    score_antiquity_no_client = db.Column(db.Float, unique=False, nullable=True)
    score_credit_antiquity = db.Column(db.Float, unique=False, nullable=True)
    score_max_delays_12m = db.Column(db.Float, unique=False, nullable=True)
    score_past_due_avg_days = db.Column(db.Float, unique=False, nullable=True)
    score_interest_coverage = db.Column(db.Float, unique=False, nullable=True)
    total_finacial_debt = db.Column(db.Float, unique=False, nullable=True)
    score_business_stability = db.Column(db.Float, unique=False, nullable=True)
    score_monex_payment_experience = db.Column(db.Float, unique=False, nullable=True)

    adjusted_payment_bureau_behaviour = db.Column(db.String, unique=False, nullable=True)
    score_payment_bureau_behaviour = db.Column(db.String, unique=False, nullable=True)
    score_operation_antiquity_rule = db.Column(db.String, unique=False, nullable=True)
    economic_activity_adjustment = db.Column(db.String, unique=False, nullable=True)
    profitability = db.Column(db.String, unique=False, nullable=True)
    score_profitability = db.Column(db.String, unique=False, nullable=True)
    score_government_dependencies = db.Column(db.String, unique=False, nullable=True)
    score_esg = db.Column(db.String, unique=False, nullable=True)
    property_solvency = db.Column(db.String, unique=False, nullable=True)
    score_property_solvency = db.Column(db.String, unique=False, nullable=True)
    exchange_op_liquity = db.Column(db.Float, unique=False, nullable=True)
    score_exchange_op = db.Column(db.String, unique=False, nullable=True)
    wallet_quality = db.Column(db.String, unique=False, nullable=True)
    score_factoring = db.Column(db.String, unique=False, nullable=True)
    score_economic_activity = db.Column(db.String, unique=False, nullable=True)
    score_warranties = db.Column(db.String, unique=False, nullable=True)

    mean_stockholders_equity = db.Column(db.Float, unique=False, nullable=True)
    mean_sales_ltm = db.Column(db.Float, unique=False, nullable=True)
    mean_payment_capacity = db.Column(db.Float, unique=False, nullable=True)

    business_profile = db.Column(db.String, unique=False, nullable=True)

    line_factor1 = db.Column(db.Float, unique=False, nullable=True)
    line_factor2 = db.Column(db.Float, unique=False, nullable=True)
    line_factor3 = db.Column(db.Float, unique=False, nullable=True)
    line_factor4 = db.Column(db.Float, unique=False, nullable=True)
    line_factor5 = db.Column(db.Float, unique=False, nullable=True)
    product_limit = db.Column(db.Float, unique=False, nullable=True)

    adjusted_max_bureau_line = db.Column(db.Float, unique=False, nullable=True)
    adjusted_avg_equity = db.Column(db.Float, unique=False, nullable=True)
    adjusted_sales_ltm = db.Column(db.Float, unique=False, nullable=True)
    adjusted_payment_capacity = db.Column(db.Float, unique=False, nullable=True)
    adjusted_equity = db.Column(db.Float, unique=False, nullable=True)
    line_granted = db.Column(db.Float, unique=False, nullable=True)

    exec_time = db.Column(db.String, unique=False, nullable=True)

    def columns_to_dict(self):
        dict_ = {}
        for key in self.__mapper__.c.keys():
            dict_[key] = getattr(self, key)
        return dict_
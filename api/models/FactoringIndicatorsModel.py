from api import db


class FactoringIndicator(db.Model):

    def __repr__(self):
        return '<FactoringIndicator %r>' % self.naira_id

    __tablename__ = "factoring_indicator"
    id = db.Column(db.Integer, primary_key=True)
    naira_id = db.Column(db.Integer, db.ForeignKey('creditapplication.id'), nullable=False)

    # Qualitative
    net_utility_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    equity_last_3_years = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    sales_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    financial_liability_total = db.Column(db.Float, unique=False, nullable=True)
    cash = db.Column(db.Float, unique=False, nullable=True)
    ebitda_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    operation_flow = db.Column(db.Float, unique=False, nullable=True)
    total_assets = db.Column(db.Float, unique=False, nullable=True)
    stockholders_equity = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    credit_balance_active_bureau = db.Column(db.Float, unique=False, nullable=True)
    paydex_12 = db.Column(db.Float, unique=False, nullable=True)
    deliquency_score = db.Column(db.Float, unique=False, nullable=True)
    cessation_score = db.Column(db.Float, unique=False, nullable=True)
    viability_score = db.Column(db.Float, unique=False, nullable=True)
    wallet_comparison = db.Column(db.Float, unique=False, nullable=True)
    company_profile = db.Column(db.String, unique=False, nullable=True)
    total_liabilities = db.Column(db.Float, unique=False, nullable=True)
    free_cashflow = db.Column(db.Float, unique=False, nullable=True)
    warranty_type = db.Column(db.String, unique=False, nullable=True)
    warranty_value = db.Column(db.Float, unique=False, nullable=True)

    score_qualitative = db.Column(db.Float, unique=False, nullable=True)

    # Quantitative
    monex_payment_experience = db.Column(db.Integer, unique=False, nullable=True)
    actual_delay = db.Column(db.Float, unique=False, nullable=True)
    max_delays_12m = db.Column(db.Integer, unique=False, nullable=True)
    days_delay = db.Column(db.Integer, unique=False, nullable=True)
    amount_delay = db.Column(db.Float, unique=False, nullable=True)
    legal_events = db.Column(db.String, unique=False, nullable=True)
    data_intensity = db.Column(db.Float, unique=False, nullable=True)
    invoices = db.Column(db.Float, unique=False, nullable=True)
    line_max_calculation = db.Column(db.Float, unique=False, nullable=True)

    score_quantitative = db.Column(db.Float, unique=False, nullable=True)

    # CMA
    government_dependencies = db.Column(db.String, unique=False, nullable=True)
    economic_activity = db.Column(db.String, unique=False, nullable=True)
    warranties = db.Column(db.String, unique=False, nullable=True)
    esg = db.Column(db.String, unique=False, nullable=True)
    current_asssets = db.Column(db.Float, unique=False, nullable=True)
    current_liabilities = db.Column(db.Float, unique=False, nullable=True)
    exchange_op = db.Column(db.Integer, unique=False, nullable=True)
    factoring = db.Column(db.Integer, unique=False, nullable=True)

    # Limits


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
    score_paydex = db.Column(db.Float, unique=False, nullable=True)
    score_deliquency = db.Column(db.Float, unique=False, nullable=True)
    score_cessation = db.Column(db.Float, unique=False, nullable=True)
    score_viability = db.Column(db.Float, unique=False, nullable=True)
    score_comparisson = db.Column(db.Float, unique=False, nullable=True)
    score_company = db.Column(db.Float, unique=False, nullable=True)
    payment_behaviour = db.Column(db.Float, unique=False, nullable=True)
    score_payment_behaviour = db.Column(db.Float, unique=False, nullable=True)
    score_days_delay = db.Column(db.Float, unique=False, nullable=True)
    score_legal_events = db.Column(db.String, unique=False, nullable=True)
    score_data_intensity = db.Column(db.String, unique=False, nullable=True)
    score_days_delays = db.Column(db.String, unique=False, nullable=True)

    business_profile = db.Column(db.String, unique=False, nullable=True)

    exec_time = db.Column(db.String, unique=False, nullable=True)

    def columns_to_dict(self):
        dict_ = {}
        for key in self.__mapper__.c.keys():
            dict_[key] = getattr(self, key)
        return dict_
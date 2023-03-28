from api import db


class PymeExpressIndicator(db.Model):

    def __repr__(self):
        return '<PymeExpressIndicator %r>' % self.naira_id

    __tablename__ = "pyme_express_indicator"
    id = db.Column(db.Integer, primary_key=True)
    naira_id = db.Column(db.Integer, db.ForeignKey('creditapplication.id'), nullable=False)

    # Qualitative
    anual_sales = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    net_utility_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    sales_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    cash = db.Column(db.Float, unique=False, nullable=True)
    ebitda_ltm = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    operation_flow = db.Column(db.Float, unique=False, nullable=True)
    total_assets = db.Column(db.Float, unique=False, nullable=True)
    stockholders_equity = db.Column(db.ARRAY(db.Float), unique=False, nullable=True)
    max_bureau_line = db.Column(db.Float, unique=False, nullable=True)
    credit_balance_active_bureau = db.Column(db.Float, unique=False, nullable=True)
    anual_inferred_income = db.Column(db.Float, unique=False, nullable=True)
    total_liabilities = db.Column(db.Float, unique=False, nullable=True)
    warranty_type = db.Column(db.String, unique=False, nullable=True)
    warranty_value = db.Column(db.Float, unique=False, nullable=True)
    endorsement_1 = db.Column(db.String, unique=False, nullable=True)
    endorsement_2 = db.Column(db.String, unique=False, nullable=True)
    endorsement_3 = db.Column(db.String, unique=False, nullable=True)


    # Behaviour
    monex_payment_experience = db.Column(db.Integer, unique=False, nullable=True)
    monex_client_antiquity = db.Column(db.Integer, unique=False, nullable=True)
    credit_antiquity = db.Column(db.Integer, unique=False, nullable=True)
    actual_delay = db.Column(db.Float, unique=False, nullable=True)
    historic_delay = db.Column(db.Float, unique=False, nullable=True)
    payment_bureau_behaviour = db.Column(db.String, unique=False, nullable=True)
    historic_behaviour = db.Column(db.String, unique=False, nullable=True)
    max_delays_12m = db.Column(db.Integer, unique=False, nullable=True)
    days_delay = db.Column(db.Integer, unique=False, nullable=True)
    amount_delay = db.Column(db.Float, unique=False, nullable=True)

    # CMA
    profitability = db.Column(db.Float, unique=False, nullable=True)
    observation_keys = db.Column(db.Integer, unique=False, nullable=True)
    esg = db.Column(db.String, unique=False, nullable=True)
    liquid_pledge = db.Column(db.String, unique=False, nullable=True)

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

    # Aggregated
    term_years = db.Column(db.Float, unique=False, nullable=True)
    payment_capacity = db.Column(db.Float, unique=False, nullable=True)
    adjusted_payment_capacity = db.Column(db.Float, unique=False, nullable=True)
    adjusted_max_bureau_line = db.Column(db.Float, unique=False, nullable=True)
    line_score = db.Column(db.Float, unique=False, nullable=True)
    line_proposal_selection = db.Column(db.String, unique=False, nullable=True)
    line_proposal = db.Column(db.Float, unique=False, nullable=True)

    line_factor1 = db.Column(db.Float, unique=False, nullable=True)
    line_factor2 = db.Column(db.Float, unique=False, nullable=True)

    product_limit = db.Column(db.Float, unique=False, nullable=True)
    line_proposal_final = db.Column(db.String, unique=False, nullable=True)
    leverage = db.Column(db.Float, unique=False, nullable=True)
    score_leverage = db.Column(db.Float, unique=False, nullable=True)
    score_quantitative = db.Column(db.Float, unique=False, nullable=True)
    score_operation_antiquity = db.Column(db.Float, unique=False, nullable=True)
    score_qualitative = db.Column(db.Float, unique=False, nullable=True)
    score_monex_payment_experience = db.Column(db.Float, unique=False, nullable=True)
    score_antiquity_client = db.Column(db.Float, unique=False, nullable=True)
    score_antiquity_no_client = db.Column(db.Float, unique=False, nullable=True)
    score_credit_antiquity = db.Column(db.Float, unique=False, nullable=True)
    score_payment_bureau_behaviour = db.Column(db.Float, unique=False, nullable=True)
    score_historic_behaviour = db.Column(db.Float, unique=False, nullable=True)
    actual_delay_amount = db.Column(db.Float, unique=False, nullable=True)
    historic_delay_amount = db.Column(db.Float, unique=False, nullable=True)
    relevant_delays = db.Column(db.Float, unique=False, nullable=True)
    score_relevant_delays = db.Column(db.Float, unique=False, nullable=True)
    line_proposal_max_bureau = db.Column(db.Float, unique=False, nullable=True)
    score_credit_relevance = db.Column(db.Float, unique=False, nullable=True)
    score_observation_keys = db.Column(db.Float, unique=False, nullable=True)
    score_behaviour = db.Column(db.Float, unique=False, nullable=True)

    score_anual_inferred_income = db.Column(db.String, unique=False, nullable=True)
    economic_sector_adjustment = db.Column(db.String, unique=False, nullable=True)
    score_economic_sector = db.Column(db.String, unique=False, nullable=True)
    score_esg = db.Column(db.String, unique=False, nullable=True)
    score_liquid_pledge = db.Column(db.String, unique=False, nullable=True)
    score_profitability = db.Column(db.String, unique=False, nullable=True)

    solvency = db.Column(db.Float, unique=False, nullable=True)

    score_solvency = db.Column(db.String, unique=False, nullable=True)
    business_profile = db.Column(db.String, unique=False, nullable=True)

    line_granted = db.Column(db.Float, unique=False, nullable=True)

    exec_time = db.Column(db.String, unique=False, nullable=True)

    def columns_to_dict(self):
        dict_ = {}
        for key in self.__mapper__.c.keys():
            dict_[key] = getattr(self, key)
        return dict_
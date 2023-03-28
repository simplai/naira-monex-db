from api import db
from flask import jsonify
class CreditApplication(db.Model):

    def __repr__(self):
        return '<CreditApplication [%s] %s - %s>' % (self.id, self.application_date, self.router)

    __tablename__ = "creditapplication"
    id = db.Column(db.Integer, primary_key=True)
    application_date = db.Column(db.String, unique=False, nullable=False)
    id_external = db.Column(db.String, unique=False, nullable=False)
    is_client = db.Column(db.Boolean, unique=False, nullable=False) # NEW
    router = db.Column(db.String, unique=False, nullable=False)

    n_employees = db.Column(db.Integer, unique=False, nullable=True) # NEW
    operation_antiquity = db.Column(db.Integer, unique=False, nullable=True) # NEW
    economic_sector = db.Column(db.String, unique=False, nullable=True) # NEW
    product_requested = db.Column(db.String, unique=False, nullable=True) # NEW
    rate = db.Column(db.Float, unique=False, nullable=True) # NEW
    term_months = db.Column(db.Integer, unique=False, nullable=True) # NEW
    payment_method_equity = db.Column(db.String, unique=False, nullable=True) # NEW
    payment_method_interest = db.Column(db.String, unique=False, nullable=True) # NEW
    credit_destiny = db.Column(db.String, unique=False, nullable=True) # NEW
    requested_amount = db.Column(db.Float, unique=False, nullable=True) # NEW
    regional = db.Column(db.String, unique=False, nullable=True) # NEW
    business_group = db.Column(db.String, unique=False, nullable=True) # NEW

    statements_date = db.Column(db.String, unique=False, nullable=True)
    currency = db.Column(db.String, unique=False, nullable=True)

    #extra_data = db.relationship('ExtraData', backref='creditapplication', lazy=True)

    insert_date = db.Column(db.DateTime, unique=False, nullable=True)
    update_date = db.Column(db.DateTime, unique=False, nullable=True)

    # Rules
    rule_id = db.Column(db.Integer, db.ForeignKey('admin_status.id'))
    rule_info = db.Column(db.String, unique=False, nullable=True)
    rule_history = db.Column(db.JSON, unique=False, nullable=True)

    # Score
    score_id = db.Column(db.Integer, db.ForeignKey('admin_score.id'))
    score = db.Column(db.Float, unique=False, nullable=True)
    score_history = db.Column(db.JSON, unique=False, nullable=True)
    business_profile = db.Column(db.String, unique=False, nullable=True)

    # Aggrupation
    aggrupation_history = db.Column(db.JSON, unique=False, nullable=True)

    # Risk level
    risk_level = db.Column(db.String, unique=False, nullable=True)

    #Final line
    line_factor = db.Column(db.Float, unique=False, nullable=True)
    line_granted = db.Column(db.Float, unique=False, nullable=True)

    # Final Status
    action_id = db.Column(db.Integer, db.ForeignKey('admin_status.id'))
    action_info = db.Column(db.String, unique=False, nullable=True)

    # Limit
    limit = db.Column(db.Float, unique=False, nullable=True)
    max_debt_service = db.Column(db.Float, unique=False, nullable=True)

    # Manual Status
    manual_action_id = db.Column(db.Integer, db.ForeignKey('admin_status.id'))
    manual_action_info = db.Column(db.String, unique=False, nullable=True)

    pymeexpressindicators = db.relationship('PymeExpressIndicator', backref='creditapplication', lazy=True)
    pymetraditionalindicators = db.relationship('PymeTraditionalIndicator', backref='creditapplication', lazy=True)
    factoringindicators = db.relationship('FactoringIndicator', backref='creditapplication', lazy=True)

    action_status = db.relationship("AdminStatus", foreign_keys=[action_id])
    manual_action_status = db.relationship("AdminStatus", foreign_keys=[manual_action_id])
    rule_status = db.relationship("AdminStatus", foreign_keys=[rule_id])
    score_status = db.relationship("AdminScore", foreign_keys=[score_id])

    def columns_to_dict(self):
        dict_ = {}
        for key in self.__mapper__.c.keys():
            dict_[key] = getattr(self, key)
        return dict_

    def get(id):
        query = db.session.query(CreditApplication)
        credit = query.filter_by(id=id)
        return credit

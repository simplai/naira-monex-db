from api import db


class ReportingIndicator(db.Model):

    def __repr__(self):
        return '<ReportingIndicator %r>' % self.naira_id

    __tablename__ = "reporting_indicator"
    id = db.Column(db.Integer, primary_key=True,)
    naira_id = db.Column(db.Integer, db.ForeignKey('creditapplication.id'), nullable=False)

    roe = db.Column(db.Float, unique=False, nullable=True)
    ebitda_margin = db.Column(db.Float, unique=False, nullable=True)
    utility_margin = db.Column(db.Float, unique=False, nullable=True)
    financial_debt_ebitda = db.Column(db.Float, unique=False, nullable=True)
    liquity = db.Column(db.Float, unique=False, nullable=True)
    leverage_rate = db.Column(db.Float, unique=False, nullable=True)
    net_debt_ebitda = db.Column(db.Float, unique=False, nullable=True)
    ebitda_liability = db.Column(db.Float, unique=False, nullable=True)
    ebitda_financial_liability = db.Column(db.Float, unique=False, nullable=True)
    sales_evolution = db.Column(db.Float, unique=False, nullable=True)
    ebitda_evolution = db.Column(db.Float, unique=False, nullable=True)
    available_balance = db.Column(db.Float, unique=False, nullable=True)
    financial_liability_total = db.Column(db.Float, unique=False, nullable=True)

    exec_time = db.Column(db.String, unique=False, nullable=True)

    def columns_to_dict(self):
        dict_ = {}
        for key in self.__mapper__.c.keys():
            dict_[key] = getattr(self, key)
        return dict_
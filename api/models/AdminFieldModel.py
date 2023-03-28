from api import db

class AdminField(db.Model):

    def __repr__(self):
        return self.field

    __tablename__ = "admin_field"
    id = db.Column(db.Integer, primary_key=True)
    field = db.Column(db.String, unique=False, nullable=False)
    condition = db.relationship('AdminCondition', backref=db.backref('field', lazy=True))
    scoreRule = db.relationship('AdminScoreRule', backref=db.backref('field', lazy=True))
    aggrupation = db.relationship('AdminAggrupation', backref=db.backref('field', lazy=True))
    aggrupationOption = db.relationship('AdminAggrupationOption', backref=db.backref('field', lazy=True))
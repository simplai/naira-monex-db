from api import db

class AdminScoreRule(db.Model):

    def __repr__(self):
        return '<AdminScoreRule [%s] - %s>' % (self.id, self.name)

    __tablename__ = "admin_score_rule"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=False, nullable=False)
    description = db.Column(db.String, unique=False, nullable=True)
    field_id = db.Column(db.Integer, db.ForeignKey('admin_field.id'))
    weight = db.Column(db.Float, unique=False, nullable=False)
    pyme_express = db.Column(db.Boolean, unique=False, nullable=True, server_default='f')
    pyme_traditional = db.Column(db.Boolean, unique=False, nullable=True, server_default='f')
    factoring = db.Column(db.Boolean, unique=False, nullable=True, server_default='f')
    use_field_value = db.Column(db.Boolean, unique=False, nullable=True, server_default='f')
    options = db.relationship('AdminScoreOption', backref='scoreRule', lazy=True)
    
    
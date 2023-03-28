from api import db

class AdminRule(db.Model):

    def __repr__(self):
        return '<AdminRule [%s] - %s>' % (self.id, self.name)

    __tablename__ = "admin_rule"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=False, nullable=False)
    description = db.Column(db.String, unique=False, nullable=True)
    pyme_express = db.Column(db.Boolean, unique=False, nullable=True, server_default='f')
    pyme_traditional = db.Column(db.Boolean, unique=False, nullable=True, server_default='f')

    order = db.Column(db.Integer, unique=False, nullable=True)
    action_id = db.Column(db.Integer, db.ForeignKey('admin_status.id'))
    conditions = db.relationship('AdminCondition', cascade="all,delete", backref='rule', lazy=True)
    actions = db.relationship('AdminStatus', lazy=True)
    
    
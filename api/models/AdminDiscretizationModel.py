from api import db

class AdminDiscretization(db.Model):

    def __repr__(self):
        return '<AdminDiscretization [%s] - %s>' % (self.id, self.name)

    __tablename__ = "admin_discretization"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=False, nullable=False)
    description = db.Column(db.String, unique=False, nullable=True)
    field_id = db.Column(db.Integer, db.ForeignKey('admin_field.id'))
    field = db.relationship('AdminField', foreign_keys=[field_id], lazy=True)
    target_id = db.Column(db.Integer, db.ForeignKey('admin_field.id'))
    target = db.relationship('AdminField', foreign_keys=[target_id], lazy=True)
    pyme_express = db.Column(db.Boolean, unique=False, nullable=True, server_default='f')
    pyme_traditional = db.Column(db.Boolean, unique=False, nullable=True, server_default='f')
    factoring = db.Column(db.Boolean, unique=False, nullable=True, server_default='f')
    conditions = db.relationship('AdminDiscretizationCondition', backref='rule', lazy=True)

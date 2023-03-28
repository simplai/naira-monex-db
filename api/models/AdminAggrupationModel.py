from api import db

class AdminAggrupation(db.Model):

    def __repr__(self):
        return '<AdminAggrupation [%s] - %s>' % (self.id, self.name)

    __tablename__ = "admin_aggrupation"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=False, nullable=True)
    description = db.Column(db.String, unique=False, nullable=True)
    router = db.Column(db.String, unique=False, nullable=False)
    field_id = db.Column(db.Integer, db.ForeignKey('admin_field.id'))
    options = db.relationship('AdminAggrupationOption', backref='aggrupation', lazy=True)
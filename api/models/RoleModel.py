from api import db
from flask_security import RoleMixin

class Role(db.Model, RoleMixin):

    def __repr__(self):
        return self.name

    __tablename__ = "role"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True, nullable=False)
    description = db.Column(db.String, unique=False, nullable=False)
from api import db

class AdminStatus(db.Model):

    def __repr__(self):
        return self.status

    __tablename__ = "admin_status"
    id = db.Column(db.Integer, primary_key=True)
    status = db.Column(db.String, unique=False, nullable=False)
    weight = db.Column(db.Float, unique=False, nullable=False)
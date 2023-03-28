from api import db

class AdminScore(db.Model):

    def __repr__(self):
        return '%s (%s)' % (self.score, str(self.min) + '-' + str(self.max))
        
    __tablename__ = "admin_score"
    id = db.Column(db.Integer, primary_key=True)
    min = db.Column(db.Float, unique=False, nullable=False)
    max = db.Column(db.Float, unique=False, nullable=False)
    name = db.Column(db.String, unique=False, nullable=True)
    router = db.Column(db.String, unique=False, nullable=True)
    score = db.Column(db.Float, unique=False, nullable=False)
    cme = db.Column(db.Float, unique=False, nullable=True, default=0) # Capacidad máxima de endeudamiento

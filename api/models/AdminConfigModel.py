from api import db

# Admin table: General configuration app params
class AdminConfig(db.Model):

    def __repr__(self):
        return '<AdminConfig [%s] - %s>' % (self.id, self.name)

    __tablename__ = "admin_config"
    id = db.Column(db.Integer, primary_key=True)
    variable = db.Column(db.String, unique=False, nullable=False)
    key = db.Column(db.String, unique=False, nullable=True)
    value = db.Column(db.String, unique=False, nullable=False)
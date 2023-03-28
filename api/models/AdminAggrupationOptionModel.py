from api import db

class AdminAggrupationOption(db.Model):

    def __repr__(self):
      return '[%s %s %%]' % (self.field, self.percentage)

    __tablename__ = "admin_aggrupation_option"
    id = db.Column(db.Integer, primary_key=True)
    percentage = db.Column(db.Integer, unique=False, nullable=False)
    field_id = db.Column(db.Integer, db.ForeignKey('admin_field.id'))
    aggrupation_id = db.Column(db.Integer, db.ForeignKey('admin_aggrupation.id'), nullable=True)
    




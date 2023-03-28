from api import db

class AdminCondition(db.Model):

    def __repr__(self):
        min = ''
        max = ''
        if self.min != None or self.max != None:
            if self.min != None:
                min = 'MIN %s' % (self.min)
            if self.max != None:
                max = 'MAX %s' % (self.max)
            return '%s [%s]' % (self.field, str(min) + ' ' + str(max))
        else:
            return '%s %s Nullable=%s' % (self.field, self.allowed, self.allowed_na)

    __tablename__ = "admin_condition"
    id = db.Column(db.Integer, primary_key=True)
    field_id = db.Column(db.Integer, db.ForeignKey('admin_field.id'))
    min = db.Column(db.Float, unique=False, nullable=True)
    max = db.Column(db.Float, unique=False, nullable=True)
    allowed =  db.Column(db.ARRAY(db.String), unique=False, nullable=True)
    allowed_na = db.Column(db.Boolean, unique=False, nullable=True)
    order = db.Column(db.Integer, unique=False, nullable=True)
    rule_id = db.Column(db.Integer, db.ForeignKey('admin_rule.id'), nullable=False)




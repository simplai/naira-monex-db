from api import db

class AdminScoreOption(db.Model):

    def __repr__(self):
        min = ''
        max = ''
        if self.min != None or self.max != None:
            if self.min != None:
                min = '%s' % (self.min)
            if self.max != None:
                max = '%s' % (self.max)
            return '%s (%s)' % (str(min) + '-' + str(max), self.ratio)
        else:
            return '%s (%s)' % (self.value, self.ratio)

    __tablename__ = "admin_score_option"
    id = db.Column(db.Integer, primary_key=True)
    min = db.Column(db.Float, unique=False, nullable=True)
    max = db.Column(db.Float, unique=False, nullable=True)
    value =  db.Column(db.String, unique=False, nullable=True)
    ratio = db.Column(db.Float, unique=False, nullable=True)
    rule_id = db.Column(db.Integer, db.ForeignKey('admin_score_rule.id'), nullable=True)




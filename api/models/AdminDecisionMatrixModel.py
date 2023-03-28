from api import db

class AdminDecisionMatrix(db.Model):

    def __repr__(self):
        return '%s %s Nullable=%s' % (self.rule_id, self.scores, self.action_id)

    __tablename__ = "admin_decision_matrix"
    id = db.Column(db.Integer, primary_key=True)
    rule_id = db.Column(db.Integer, db.ForeignKey('admin_status.id'))
    scores =  db.Column(db.ARRAY(db.Integer), unique=False, nullable=True)
    action_id = db.Column(db.Integer, db.ForeignKey('admin_status.id'))
    action_info = db.Column(db.String, unique=False, nullable=True)
    rule_status = db.relationship("AdminStatus", foreign_keys=[rule_id])
    action_status = db.relationship("AdminStatus", foreign_keys=[action_id], lazy=True)


    def columns_to_dict(self):
        dict_ = {}
        for key in self.__mapper__.c.keys():
            dict_[key] = getattr(self, key)
        return dict_
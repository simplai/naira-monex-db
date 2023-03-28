
from models.AdminDecisionMatrixModel import AdminDecisionMatrix
from utils.Logger import Logger

logger = Logger('logs')

class DecisionMatrixSystem:

    def __init__(self, cap):
        self.cap = cap
        self.id_naira = cap.id

    def execute(self):
        # Get all decision matrix rules
        # Compare status and score
        # Return Final status
        logger.logTo(self.id_naira, f'Starting decision matrix (\'{self.cap.rule_status.status}\'/{self.cap.score_status.score})', self.__class__.__name__)
        rules = AdminDecisionMatrix.query.all()
        for rule in rules: 
            logger.logTo(self.id_naira, f'Checking rule \'{rule.rule_status.status}\' with scores {rule.scores}', self.__class__.__name__)
            if rule.rule_id == self.cap.rule_id:
                if self.cap.score_status.score in rule.scores:
                    logger.logTo(self.id_naira, f'  MATCH!!! \'{rule.rule_status.status}\' and score {self.cap.score_status.score}', self.__class__.__name__)
                    logger.logTo(self.id_naira, f'Final decision matrix is {rule.action_status} {rule.action_info}', self.__class__.__name__)
                    return(rule)
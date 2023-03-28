from marshmallow import Schema, fields, INCLUDE, ValidationError
from marshmallow.validate import Length, Range, OneOf
import json
import jsonschema
from schemas.JSONSchemas import RuleHistorySchema, ScoreHistorySchema, AggrupationHistorySchema

class CreditApplicationSchema(Schema):
    routers = ["aggregation", "express", "tradicional", "factoraje", "arrendamiento"]

    class Meta:
        fields = ("application_date", "id_naira", "is_client", "id_external", "id", "router", "amount",
        "duration", "extra", "business_group", "credit_destiny", "economic_sector", "n_employees", "operation_antiquity",
        "payment_method_equity", "payment_method_interest", "product_requested", "rate", "term_months", "regional",
        "requested_amount", "score_status.score", "action_status.status", "pyme_express", "reporting", "score",
        "business_profile", "statements_date", "currency", "line_granted", "riskData", "reportingData", "rulesData", "scoresData", "aggData")

    application_date = fields.Str(required=(True), validate=Length(max=8, error='Application date must be a string AAAAMMDD'))
    id_external = fields.Number(required=(True))
    is_client = fields.Bool(required=(True))
    id_naira = fields.Number(required=(False))
    router = fields.Str(required=(True), validate=(Length(max=11, error='router be a string shorter than 11 letters.'), OneOf(routers)))
    n_employees = fields.Number(required=(False))
    operation_antiquity = fields.Number(required=(False))
    economic_sector = fields.Str(required=(False))
    product_requested = fields.Str(required=(False))
    rate = fields.Number(required=(False))
    term_months = fields.Number(required=(False))
    payment_method_equity = fields.Str(required=(False))
    payment_method_interest = fields.Str(required=(False))
    credit_destiny = fields.Str(required=(False))
    requested_amount = fields.Number(required=(False))
    regional = fields.Str(required=(False))
    business_group = fields.Str(required=(False))
    business_profile = fields.Str(required=(False))
    line_granted = fields.Number(required=(False))
    statements_date = fields.Str(required=(False))
    currency = fields.Str(required=(False))
    score = fields.Number(required=(False))

    riskData        = fields.Method('get_riskData')
    reportingData   = fields.Method('get_reportingData')
    rulesData       = fields.Method('get_rulesData')
    scoresData      = fields.Method('get_scoresData')
    aggData         = fields.Method('get_aggData')

    def get_riskData(self, obj):
        if obj.router == "express":
            from models.PymeExpressIndicatorsModel import PymeExpressIndicator
            riskData = PymeExpressIndicator.query.filter_by(naira_id=obj.id).first()
            
        elif obj.router == "tradicional":
            from models.PymeTraditionalIndicatorsModel import PymeTraditionalIndicator
            riskData = PymeTraditionalIndicator.query.filter_by(naira_id=obj.id).first()

        elif obj.router == 'factoraje':
            from models.FactoringIndicatorsModel import FactoringIndicator
            riskData = FactoringIndicator.query.filter_by(naira_id=obj.id).first()

        elif obj.router == 'arrendamiento':
            from models.LeasingIndicatorsModel import LeasingIndicator
            riskData = LeasingIndicator.query.filter_by(naira_id=obj.id).first()

        if riskData:
            return riskData.columns_to_dict()

        return {}
    
    def get_reportingData(self, obj):
        from models.ReportingIndicatorsModel import ReportingIndicator
        return ReportingIndicator.query.filter_by(naira_id=obj.id).first().columns_to_dict()
    
    def get_rulesData(self, obj):
        rule_history = {}
        if obj.rule_history:
            rule_history = json.loads(obj.rule_history)
            for rule in rule_history:
                jsonschema.validate(rule, RuleHistorySchema)

        return rule_history
    
    def get_scoresData(self, obj):
        score_history = {}
        if obj.score_history:
            score_history = json.loads(obj.score_history)
            for rule in score_history:
                jsonschema.validate(rule, ScoreHistorySchema)

        return score_history

    def get_aggData(self, obj):
        agg_dict = {}
        if obj.aggrupation_history:
            aggrupation_history = json.loads(obj.aggrupation_history)
            for rule in aggrupation_history:
                jsonschema.validate(rule, AggrupationHistorySchema)

            for elem in aggrupation_history:
                agg_dict[elem["name"]] = {}
                for cond in elem["conditions"]:
                    agg_dict[elem["name"]][cond["field"]] = cond["percentage"]
                    
        return agg_dict

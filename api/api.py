from gettext import install
from flask import Flask, request, jsonify, render_template, url_for
import json
import time
import datetime
from utils.errors import handle_exceptions
from datetime import timedelta
from flask_admin import Admin
from flask_admin import helpers as admin_helpers
from flask_security import Security, SQLAlchemyUserDatastore, login_required
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.sql import text
from sqlalchemy.orm import aliased
from flask_migrate import Migrate
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, verify_jwt_in_request, JWTManager, create_refresh_token
from utils.Logger import Logger
from functools import wraps
from decouple import config

# Init
app = Flask(__name__)

#app.config['SQLALCHEMY_MAX_OVERFLOW'] = 20
app.config['SQLALCHEMY_POOL_SIZE'] = 100
app.config.from_object(f"config.{config('FLASK_ENV').capitalize()}Config")

db=SQLAlchemy(app)

migrate = Migrate(app, db, compare_type=True)
logger = Logger('logs')

# Schemas
from schemas import userSchema
from schemas.creditApplicationSchema import CreditApplicationSchema

user_schema = userSchema.UserSchema()
CreditApplicationSchemas = CreditApplicationSchema()
CreditApplicationSchemaMany = CreditApplicationSchema(many=True)

# Models
from models.Db import db
from models.UserModel import User
from models.RoleModel import Role
from models.CreditApplicationModel import CreditApplication
from models.AdminRuleModel import AdminRule
from models.AdminFieldModel import AdminField
from models.AdminStatusModel import AdminStatus
from models.AdminConfigModel import AdminConfig
from models.UserModel import User
from models.RoleModel import Role
from models.PymeExpressIndicatorsModel import PymeExpressIndicator
from models.PymeTraditionalIndicatorsModel import PymeTraditionalIndicator
from models.FactoringIndicatorsModel import FactoringIndicator
from models.LeasingIndicatorsModel import LeasingIndicator
from models.ReportingIndicatorsModel import ReportingIndicator
from models.AdminScoreRuleModel import AdminScoreRule
from models.AdminScoreModel import AdminScore
from models.AdminDecisionMatrixModel import AdminDecisionMatrix
from models.AdminAggrupationModel import AdminAggrupation
from models.AdminDiscretizationModel import AdminDiscretization

# Scripts
from scripts import RuleSystem, ScoreSystem, DecisionMatrixSystem, PymeExpressSpences, Reporting, AggrupationSystem, DiscretizationSystem, Factoring, Traditional, Leasing

db.init_app(app)

# Flask admin
# Set the secret key to some random bytes. Keep this really secret!
app.secret_key = config('FLASK_SECRET')
user_datastore = SQLAlchemyUserDatastore(db, User, Role)
security       = Security(app, user_datastore)

# Admin Views
from views.generic import MyAdminIndexView
admin = Admin(app, name='Naira Admin',  base_template='my_master.html', template_mode='bootstrap3', index_view=MyAdminIndexView())

import warnings

with warnings.catch_warnings():
    # To avoid fields missing warning on router views.
    warnings.filterwarnings('ignore', 'Fields missing from ruleset', UserWarning)

    from views.creditApplicationViews import AdminCapView
    admin.add_view(AdminCapView(CreditApplication, db.session, category="Applications"))

    from views.expressViews import AdminExpressDiscretizationView, AdminExpressAggrupationView, AdminExpressScoreRuleView, AdminExpressRuleView
    admin.add_view(AdminExpressDiscretizationView(AdminDiscretization, db.session, category="Express", name="Score - Discretization", endpoint="AdminExpressDiscretization"))
    admin.add_view(AdminExpressAggrupationView(AdminAggrupation, db.session, category="Express", name="Score - Aggrupation", endpoint="AdminExpressAggrupation"))
    admin.add_view(AdminExpressScoreRuleView(AdminScoreRule, db.session, category="Express", name="Score - Definition", endpoint="AdminExpressScoreRule"))
    admin.add_view(AdminExpressRuleView(AdminRule, db.session, category="Express", name="Rules - Admission", endpoint="AdminExpressRule"))

    from views.factoringViews import AdminFactoringDiscretizationView, AdminFactoringAggrupationView, AdminFactoringScoreRuleView, AdminFactoringRuleView
    admin.add_view(AdminFactoringDiscretizationView(AdminDiscretization, db.session, category="Factoring", name="Score - Discretization", endpoint="AdminFactoringDiscretization"))
    admin.add_view(AdminFactoringAggrupationView(AdminAggrupation, db.session, category="Factoring", name="Score - Aggrupation", endpoint="AdminFactoringAggrupation"))
    admin.add_view(AdminFactoringScoreRuleView(AdminScoreRule, db.session, category="Factoring", name="Score - Definition", endpoint="AdminFactoringScoreRule"))
    admin.add_view(AdminFactoringRuleView(AdminRule, db.session, category="Factoring", name="Rules - Admission", endpoint="AdminFactoringRule"))


    from views.leasingViews import AdminLeasingDiscretizationView, AdminLeasingAggrupationView, AdminLeasingScoreRuleView, AdminLeasingRuleView
    admin.add_view(AdminLeasingDiscretizationView(AdminDiscretization, db.session, category="Leasing", name="Score - Discretization", endpoint="AdminLeasingDiscretization"))
    admin.add_view(AdminLeasingAggrupationView(AdminAggrupation, db.session, category="Leasing", name="Score - Aggrupation", endpoint="AdminLeasingAggrupation"))
    admin.add_view(AdminLeasingScoreRuleView(AdminScoreRule, db.session, category="Leasing", name="Score - Definition", endpoint="AdminLeasingScoreRule"))
    admin.add_view(AdminLeasingRuleView(AdminRule, db.session, category="Leasing", name="Rules - Admission", endpoint="AdminLeasingRule"))

    from views.traditionalViews import AdminTraditionalDiscretizationView, AdminTraditionalAggrupationView, AdminTraditionalScoreRuleView, AdminTraditionalRuleView
    admin.add_view(AdminTraditionalDiscretizationView(AdminDiscretization, db.session, category="Traditional", name="Score - Discretization", endpoint="AdminTraditionalDiscretization"))
    admin.add_view(AdminTraditionalAggrupationView(AdminAggrupation, db.session, category="Traditional", name="Score - Aggrupation", endpoint="AdminTraditionalAggrupation"))
    admin.add_view(AdminTraditionalScoreRuleView(AdminScoreRule, db.session, category="Traditional", name="Score - Definition", endpoint="AdminTraditionalScoreRule"))
    admin.add_view(AdminTraditionalRuleView(AdminRule, db.session, category="Traditional", name="Rules - Admission", endpoint="AdminTraditionalRule"))


    from views.configurationViews import AdminModelView, AdminFieldView, AdminConfigView, AdminDecisionMatrixView, AdminScoreView
    admin.add_view(AdminConfigView(AdminConfig, db.session, category="Configuration"))
    admin.add_view(AdminModelView(AdminStatus, db.session, category="Configuration", name="Actions Weights"))
    admin.add_view(AdminFieldView(AdminField, db.session, category="Configuration", name="Fields Configuration"))
    admin.add_view(AdminScoreView(AdminScore, db.session, category="Configuration", name="Score - Matrix"))
    admin.add_view(AdminDecisionMatrixView(AdminDecisionMatrix, db.session, category="Configuration", name="Rules - Decision Matrix"))

# Flask Security
@security.context_processor
def security_context_processor():
    return dict(
        admin_base_template = admin.base_template,
        admin_view = admin.index_view,
        h = admin_helpers,
        get_url = url_for
    )

# Flask JWT
jwt = JWTManager(app)

# This decorator executes before function called (Must be added as @trackUserLastAction)
# Gets user and update last_action field on database
def trackUserLastAction():
    def decorator(f):
        @wraps(f)
        def wrapped(*args, **kwargs):
            info = verify_jwt_in_request(optional=True)
            if info!= None:
              now = datetime.datetime.utcnow()
              user = User.query.filter_by(email=info[1]["sub"]).first()
              user.last_action = now
              db.session.commit()
            return f(*args, **kwargs)
        return wrapped
    return decorator

@login_required
@app.route("/")
def index():
    # This is the way to get a valid access token
    # access_token = create_access_token(identity='admin')
    # return jsonify(access_token=access_token)
    return render_template('index.html')

def diffdates(d1, d2):
    return (time.mktime(time.strptime(d2,"%Y-%m-%d %H:%M:%S")) -
               time.mktime(time.strptime(d1, "%Y-%m-%d %H:%M:%S")))

# Create a route to authenticate your users and return JWTs. The
# create_access_token() function is used to actually generate the JWT.
# create_refresh_token() function used to genereate a refresh token
@app.route("/getJwt", methods=["POST"])
@handle_exceptions
def getJwt():
    email = request.json.get("email", None)
    password = request.json.get("password", None)
    user = security.datastore.find_user(email=email)
    
    if user is None:
        return {"meta": {"code": 400}, "response": {"errors": ["Specified user does not exist"]}}
    if not user.check_password(password):
        return {"meta": {"code": 400}, "response": {"errors": ["Invalid password"]}}
    # Check for last_action of this user, block if diff <= config secs
    MAX_INACTIVE_SECS = float(db.session.query(AdminConfig.value).filter_by(key='MAX_INACTIVE_SECS', variable='general').first()[0])
    if (datetime.datetime.utcnow() - user.last_action).total_seconds() <= MAX_INACTIVE_SECS:
        return {"meta": {"code": 400}, "response": {"errors": ["There is a current active session with this username"]}}
    return {
            "meta": {
                "code": 200
            },
            "response": {
                "user": {
                    "authentication_token": create_access_token(identity=email, expires_delta=timedelta(minutes=5)),
                    "email": user.email,
                    "id": 1,
                    "name": user.name,
                    "role": "admin",
                    "refresh": create_refresh_token(identity=email, expires_delta=timedelta(minutes=5)),
                }
            },

        }

# We are using the `refresh=True` options in jwt_required to only allow
# refresh tokens to access this route.
@app.route("/refreshJwt", methods=["POST"])
@jwt_required(refresh=True)
def refresh():
    identity = get_jwt_identity()
    access_token = create_access_token(identity=identity, expires_delta=timedelta(minutes=5))
    return jsonify(access=access_token)

@app.route("/checkJwt", methods=["GET"])
@jwt_required()
def check_jwt():
    return {"msg": "Token is alive"}

# Protect a route with jwt_required, which will kick out requests
# without a valid JWT present.
@app.route("/protected", methods=["GET"])
@jwt_required()
def protected():
    # Access the identity of the current user with get_jwt_identity
    current_user = get_jwt_identity()
    return jsonify(logged_in_as=current_user), 200

@app.route("/creditApplication", methods=["POST"])
@handle_exceptions
@jwt_required()
def addCreditApplication():
    # Load config
    application_fields = ["application_date", "id_external", "is_client", "router",
    "n_employees", "operation_antiquity", "economic_sector", "product_requested", "rate", "term_months",
    "payment_method_equity", "payment_method_interest", "credit_destiny", "requested_amount", "regional",
    "business_group", "amount", "statements_date", "currency"]

    json_data = json.loads(request.data)
    application_info = {field: json_data[field] for field in application_fields if field in json_data}
    # Validate creditApplication
    CreditApplicationSchemas.load(application_info)
    
    # Update credit application
    if "id_naira" in json_data:
        id_naira = json_data["id_naira"]
        logger.logTo(id_naira, f'Updating creditApplication')
        del json_data['id_naira']
        cap = CreditApplication.query.get(id_naira)
        # Restart all optional fields
        cap.rule_id = cap.rule_info = cap.rule_history = cap.score_id = cap.score_history = cap.action_id = None
        cap.action_info = cap.manual_action_id = cap.manual_action_info = None
        cap.score = 0
        if not cap:
            # Error
            message = {"error": "id_naira doesn't exits", "status": 400}
            return message

        for key, value in json_data.items():
            setattr(cap, key, value)

        # Remove previous data
        PymeExpressIndicator.query.filter_by(naira_id=id_naira).delete()
        Factoring.query.filter_by(naira_id=id_naira).delete()
        Traditional.query.filter_by(naira_id=id_naira).delete()
        Leasing.query.filter_by(naira_id=id_naira).delete()
        logger.logTo(id_naira, f'Updating extra data to creditApplication')

        cap.update_date = datetime.datetime.utcnow()
        db.session.commit()
        logger.logJson(request.data, 'Update', id_naira)

    # Insert credit application
    else:
        cap = CreditApplication(**application_info)
        cap.insert_date = datetime.datetime.utcnow()
        print(cap.columns_to_dict())
        db.session.add(cap)
        db.session.flush()

        id_naira = cap.id
        logger.logJson(request.data, 'Insert', id_naira)
        db.session.commit()

    # Always Calculate Reporting even when aggregation is present
    reporting = Reporting.Reporting(id_naira, json_data)
    reporting.execute()
    repIndicators = ReportingIndicator(**reporting.to_dict())

    db.session.add(repIndicators)
    db.session.commit()

    if json_data["router"] == "express":
        express_fields = ["amount", "anual_sales", "net_utility_ltm", "equity_last_3_years", "sales_ltm",
            "cash", "ebitda_ltm", "operation_flow", "total_assets", "stockholders_equity", "max_bureau_line",
            "credit_balance_active_bureau", "anual_inferred_income", "total_liabilities", "warranty_type",
            "warranty_value", "shareholder_experience", "business_stability",
            "monex_payment_experience", "monex_client_antiquity", "credit_antiquity", "actual_delay", "historic_delay",
            "payment_bureau_behaviour", "historic_behaviour", "max_delays_12m", "days_delay", "amount_delay",
            "profitability", "observation_keys", "esg", "liquid_pledge", "active_credits",
            "default_29", "default_59", "default_89", "default_119", "default_179", "default_more", "breaks",
            "restructures", "var_1m_debt", "var_1y_debt", "bureau_alert", "endorsement_1", "endorsement_2", "endorsement_3"]

        express_info = {field: json_data[field] for field in express_fields if field in json_data}

        spence = PymeExpressSpences.PymeExpressSpence(cap, id_naira, **express_info)
        spence.execute()
        decIndicators = PymeExpressIndicator(**spence.to_dict())

        db.session.add(decIndicators)
        db.session.commit()
    elif json_data["router"] == "tradicional":
        traditional_fields = [
        "net_utility_ltm", "sales_ltm", "financial_liability_total", "cash", "ebitda_ltm",
        "sales_cost", "operation_expenses", "financial_expenses_ltm", "operation_flow", "debt_payable", "taxes_payable",
        "taxes_receivable", "debt_short", "debt_long", "inventories", "accounts_receivable", "total_assets", "expired_wallet",
        "total_wallet", "stockholders_equity", "admin_expenses", "properties_and_equipment", "max_bureau_line",
        "credit_balance_active_bureau", "assets_long", "liabilities_long", "total_liabilities",
        "warranty_type", "warranty_value", "shareholder_experience", "business_stability", "monex_payment_experience",
        "monex_client_antiquity", "credit_antiquity", "past_due_avg_days", "actual_delay", "payment_bureau_behaviour", "max_delays_12m",
        "days_delay", "amount_delay", "government_dependencies", "economic_activity", "warranties", "esg", "current_asssets",
        "current_liabilities", "exchange_op", "factoring", "basic_equity", "active_credits", "default_29", "default_59",
        "default_89", "default_119", "default_179", "default_more", "breaks", "restructures", "var_1m_debt", "var_1y_debt",
        "bureau_alert", "endorsement_1", "endorsement_2", "endorsement_3"]

        traditional_info = {field: json_data[field] for field in traditional_fields if field in json_data}

        spence = Traditional.Traditional(cap, id_naira, **traditional_info)
        spence.execute()
        decIndicators = PymeTraditionalIndicator(**spence.to_dict())

        db.session.add(decIndicators)
        db.session.commit()
    elif json_data["router"] == "factoraje":
        factoring_fields = ["amount", "anual_sales", "net_utility_ltm", "equity_last_3_years", "sales_ltm",
        "cash", "ebitda_ltm", "operation_flow", "total_assets", "stockholders_equity", "max_bureau_line",
        "credit_balance_active_bureau", "anual_inferred_income", "total_liabilities", "warranty_type",
        "warranty_value", "shareholder_experience", "business_stability",
        "monex_payment_experience", "monex_client_antiquity", "credit_antiquity", "actual_delay", "historic_delay",
        "payment_bureau_behaviour", "historic_behaviour", "max_delays_12m", "days_delay", "amount_delay",
        "profitability", "observation_keys", "esg", "liquid_pledge", "active_credits",
        "default_29", "default_59", "default_89", "default_119", "default_179", "default_more", "breaks",
        "restructures", "var_1m_debt", "var_1y_debt", "bureau_alert", "endorsement_1", "endorsement_2", "endorsement_3"]

        factoring_info = {field: json_data[field] for field in factoring_fields if field in json_data}

        spence = Factoring.Factoring(cap, id_naira, **factoring_info)
        spence.execute()
        decIndicators = FactoringIndicator(**spence.to_dict())

        db.session.add(decIndicators)
        db.session.commit()
    elif json_data["router"] == "arrendamiento":
        leasing_fields = ["amount", "anual_sales", "net_utility_ltm", "equity_last_3_years", "sales_ltm",
        "cash", "ebitda_ltm", "operation_flow", "total_assets", "stockholders_equity", "max_bureau_line",
        "credit_balance_active_bureau", "anual_inferred_income", "total_liabilities", "warranty_type",
        "warranty_value", "shareholder_experience", "business_stability",
        "monex_payment_experience", "monex_client_antiquity", "credit_antiquity", "actual_delay", "historic_delay",
        "payment_bureau_behaviour", "historic_behaviour", "max_delays_12m", "days_delay", "amount_delay",
        "profitability", "observation_keys", "esg", "liquid_pledge", "active_credits",
        "default_29", "default_59", "default_89", "default_119", "default_179", "default_more", "breaks",
        "restructures", "var_1m_debt", "var_1y_debt", "bureau_alert", "endorsement_1", "endorsement_2", "endorsement_3"]

        leasing_info = {field: json_data[field] for field in leasing_fields if field in json_data}

        spence = Leasing.Leasing(cap, id_naira, **leasing_info)
        spence.execute()
        decIndicators = LeasingIndicator(**spence.to_dict())

        db.session.add(decIndicators)
        db.session.commit()
    
    # Apply rules
    ruleSystem = RuleSystem.RuleSystem(cap)
    rule, rule_info, rule_history = ruleSystem.execute()

    cap.rule_id = rule.id
    cap.rule_info = json.dumps(rule_info)
    cap.rule_history = rule_history

    # Apply discretization calculation
    discretizationSystem = DiscretizationSystem.DiscretizationSystem(cap)
    discretizationSystem.execute()

    # Apply aggrupation calculation
    aggrupationSystem = AggrupationSystem.AggrupationSystem(cap)
    cap.aggrupation_history = aggrupationSystem.execute()

    # Apply score calculation
    score = ScoreSystem.ScoreSystem(cap)

    score, score_100, risk_level, line_factor, scoreHistory = score.execute()

    cap.score_id = score.id
    cap.score = score_100
    cap.risk_level = risk_level
    cap.score_history = scoreHistory
    cap.line_factor = line_factor

    cap.line_granted = spence.line_calculation(line_factor)

    # Final decission matrix
    decisionMatrix = DecisionMatrixSystem.DecisionMatrixSystem(cap)
    decisionMatrix = decisionMatrix.execute()
    cap.action_id = decisionMatrix.action_id
    cap.action_info = decisionMatrix.action_info
    cap.business_profile = str(rule)

    logger.logTo(id_naira, f'Final calculations on creditApplication process (limits)')
    
    db.session.add(cap)
    db.session.commit()

    db.session.add(decIndicators)
    db.session.commit()

    # return
    message = {
    "id_naira": id_naira,
    "sophia-admission": cap.action_status.status,
    "sophia-score": score.score,
    "rule-reason": rule_info[0] if len(rule_info) > 0 else "No rule matched",
    "rule": str(rule),
    "status": 201}
    return message



@app.route("/updateRecommendation", methods=["POST"])
@handle_exceptions
@trackUserLastAction()
@jwt_required()
def updateRecommendation():
    json_data = json.loads(request.data)
    print(json_data)

    cap = CreditApplication.query.get(json_data["id"])
    print(cap)

#     cap.action_id = 0
#     cap.action_info = "User Updated"
#     cap.business_profile = json_data["recommendation"]
#
#     db.session.add(cap)
#     db.session.commit()

    # admin = db.session.query(AdminConfig.value).filter_by(key='ACCEPTED', variable='general').first()[0]
    manualStatus = db.session.query(AdminStatus.id).filter_by(status="UPDATED").first()[0]

    cap.action_id = manualStatus
    cap.action_info = "UPDATED"
    cap.business_profile = json_data["recommendation"]

    db.session.add(cap)
    db.session.commit()

    logger.logTo(json_data["id"], f'Manual update of recommendation to {json_data["recommendation"]}', "OPERATION")

    return {"msg": "OK", "status": 201}




@app.route("/creditApplication/list", methods=["GET"])
@handle_exceptions
@trackUserLastAction()
@jwt_required()
def listCreditApplication():
    ordering = request.args.get('order') or ['insert_date', 'desc']
    page = int(request.args.get('page') or 0)
    # search = request.args.get('search') or ""
    size = int(request.args.get('size') or 10)

    # if request.args.get('search') is not None:
    #     search = request.args.get('search')
    # else:
    #     search = ""

    # Filter by fixed status
    if request.args.get('status_id') is not None:
        status = [request.args.get('status_id')]
    else:
        # Filter by status
        if request.args.get('status_id__in') is not None:
            status = request.args.get('status_id__in').split(',')
        else:
            status = None

    # Filter by score
    if request.args.get('category__in') is not None:
        score = request.args.get('category__in').split(',')
    else:
        score = None

    # Filter by date
    if request.args.get('created_at__gt') is not None and request.args.get('created_at__lte') is not None:
        dateInit = request.args.get('created_at__gt').replace('-','')[:8]
        dateEnd = request.args.get('created_at__lte').replace('-','')[:8]
    else:
        dateInit = None
        dateEnd = None

    ordering = ' '.join(ordering)
    
    if status != None or score != None:
        if status != None:

            # Need to replace front constants to backend values (Config)
            ACCEPTED = db.session.query(AdminConfig.value).filter_by(key='ACCEPTED', variable='general').first()[0]
            REJECTED = db.session.query(AdminConfig.value).filter_by(key='REJECTED', variable='general').first()[0]
            REVIEW = db.session.query(AdminConfig.value).filter_by(key='REVIEW', variable='general').first()[0]
            for id, item in enumerate(status):
                if "ACCEPTED" in item:
                    status[id] = ACCEPTED
                elif "REJECTED" in item:
                    status[id] = REJECTED
                elif "REVIEW" in item:
                    status[id] = REVIEW
        actionSatus = aliased(AdminStatus)
        # manualStatus = aliased(AdminStatus)
        cap_count = CreditApplication.query\
            .join(actionSatus, CreditApplication.action_id == actionSatus.id)\
            .join(CreditApplication.score_status)\
            .filter(\
                actionSatus.status.in_(status) if status != None else actionSatus.status.is_not(None),\
                AdminScore.score.in_(score) if score != None else AdminScore.score.is_not(None),\
                CreditApplication.insert_date.between(dateInit, dateEnd) if dateInit != None and dateEnd != None else CreditApplication.insert_date.is_not(None)\
                ).all()
                #CreditApplication.client.contains(search)).all()

        cap = CreditApplication.query\
            .join(actionSatus, CreditApplication.action_id == actionSatus.id)\
            .join(CreditApplication.score_status)\
            .filter(\
                actionSatus.status.in_(status) if status != None else actionSatus.status.is_not(None),\
                AdminScore.score.in_(score) if score != None else AdminScore.score.is_not(None),\
                CreditApplication.insert_date.between(dateInit, dateEnd) if dateInit != None and dateEnd != None else CreditApplication.insert_date.is_not(None))\
            .order_by(text(ordering)).limit(size).offset((page) * size).all()
            #  CreditApplication.client.contains(search))\
    else:
        cap_count = CreditApplication.query.filter(\
            CreditApplication.insert_date.between(dateInit, dateEnd) if dateInit != None and dateEnd != None else CreditApplication.insert_date.is_not(None)\
            ).all()
            #CreditApplication.client.contains(search)).all()

        cap = CreditApplication.query.filter(\
            CreditApplication.insert_date.between(dateInit, dateEnd) if dateInit != None and dateEnd != None else CreditApplication.insert_date.is_not(None))\
            .order_by(text(ordering)).limit(size).offset((page) * size).all()
            #CreditApplication.client.contains(search))\
    # TODO Look for a way to avoid an extra query to count
    
    # To avoid dict TypeError: cannot convert dictionary update sequence element #0 to a sequence
    return({
        'count': len(cap_count),
        'size': size,
        'next': page + 1,
        'previous': page,
        'results': CreditApplicationSchemaMany.dump(cap)
    })

@app.route("/creditApplication/list/<cap_id>", methods=["GET"])
@handle_exceptions
@trackUserLastAction()
@jwt_required()
def getCreditApplication(cap_id):
    cap = CreditApplication.get(cap_id)
    return CreditApplicationSchemaMany.dump(cap)[0]

@app.route("/creditApplication/list/<cap_id>/status/<status>", methods=["PUT"])
@handle_exceptions
@trackUserLastAction()
@jwt_required()
def updateCreditApplicationStatus(cap_id, status):
    logger.logTo(cap_id, f'Manual Status sent for creditApplication {status}')
    cap = CreditApplication.query.get(cap_id)
    # Need to replace front constants to backend values (Config)
    ACCEPTED = db.session.query(AdminConfig.value).filter_by(key='ACCEPTED', variable='general').first()[0]
    REJECTED = db.session.query(AdminConfig.value).filter_by(key='REJECTED', variable='general').first()[0]
    REVIEW = db.session.query(AdminConfig.value).filter_by(key='REVIEW', variable='general').first()[0]
    if status == "ACCEPTED":
        status = ACCEPTED
    elif status == "REJECTED":
        status = REJECTED
    elif status == "REVIEW":
        status = REVIEW
    manualStatus = db.session.query(AdminStatus.id).filter_by(status=status).first()[0]
    cap.manual_action_id = manualStatus
    cap.manual_action_info = "Status modificado por usuario"
    db.session.commit()
    return "True"



if __name__=="__main__":
    debug = True if config('FLASK_DEBUG') == "True" else False
    app.run(host=config('FLASK_HOST'), port=config('FLASK_PORT'), debug=debug, ssl_context=('cert.pem', 'key.pem'))
else:
    # Production with UWSGI
    application = app

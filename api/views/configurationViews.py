from views.generic import GenericModelView, AdminModelView
from models.AdminScoreOptionModel import AdminScoreOption


class AdminScoreRuleView(GenericModelView):
    column_display_pk = True
    column_filters = ('id', 'name')
    column_list = ['id','name', 'description', 'pyme_express', 'weight', 'field', 'options']
    can_view_details = True
    inline_models = [AdminScoreOption]
    column_hide_backrefs = False
    column_default_sort = 'id'

class AdminConfigView(AdminModelView):
    column_filters = ('id', 'variable')
    column_default_sort = 'id'
    column_editable_list = ['key','value']

class AdminScoreView(AdminModelView):
    column_filters = ('id', 'router', 'min', 'max', 'score', 'name')
    column_default_sort = 'id'


class AggregationIndicatorView(AdminModelView):
    column_default_sort = 'naira_id'
    can_view_details = True
    column_list = ['naira_id', 'total_expense_ordinary', 'total_expense_extraordinary',
    'total_expense_cog', 'total_expense_rent', 'total_expense_utilities',
    'total_expense_staff', 'total_expense_equip', 'total_expense_financial',
    'total_expense_tax', 'total_expense_tech', 'total_expense_others',
    'total_expense', 'pct_completeness_expenses', 'flag_recovery',
    'expense_recovery', 'n_recovery', 'flag_doverdraft',
    'expense_overdraft', 'n_overdraft', 'top3_expense_cog',
    'total_income_ordinary', 'total_income_extraordinary',
    'total_income_transfer', 'max_balance', 'min_balance',
    'days_in_negative', 'min_balance_3m', 'top3_income_ordinary',
    'mom_performance_sales', 'total_income_ordinary_2m', 'net_margin',
    'gross_margin', 'cost_rate_staff', 'cost_rate_rent',
    'cost_rate_utilities', 'concentration_sales', 'concentration_purchase',
    'cash_flow_total', 'cash_flow_real', 'debt_service_ratio', 'cash_track',
    'account_balance', 'n_accounts', 'n_movements_agb',
    'first_movement_date_agb', 'last_movement_date_agb', 'n_days_agb',
    'cat_rate_expenses', 'cat_rate_income', 'categorization_time', 'exec_time']
    column_filters = ['naira_id']
    column_labels = dict(naira_id='Naira ID')
    can_view_details = True
    can_edit = False
    can_delete = False
    can_create = False

class ExtraDataView(AdminModelView):
    column_default_sort = 'naira_id'
    can_view_details = True
    column_list = ['naira_id','infocif_date', 'infocif_name', 'trends_date', 'google_date'] # Add more
    column_filters = ['naira_id']
    column_labels = dict(naira_id='Naira ID')
    can_view_details = True
    can_edit = False
    can_delete = False
    can_create = False

class AdminFieldView(AdminModelView):
    column_default_sort = 'field'
    column_list = ['id', 'field']
    column_filters = ['id', 'field']
    form_excluded_columns = ('condition', 'scoreRule', 'aggrupation', 'aggrupationOption')

class AdminExpressScoreView(AdminModelView):
    column_filters = ('id', 'router', 'min', 'max', 'score', 'name')
    column_default_sort = 'id'

class AdminDecisionMatrixView(AdminModelView):
    column_list = ['rule_status','scores', 'action_status', 'action_info']
    column_details_list = ['rule_status','scores', 'action_status', 'action_info']
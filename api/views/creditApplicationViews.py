from views.generic import GenericModelView

class AdminCapView(GenericModelView):
    column_display_pk = True
    column_default_sort = 'id'
    column_filters = ['id', 'router', 'insert_date']
    column_list = ['id', 'id_external', 'router','insert_date','rule_status', 'score', 'score_status','action_status','limit','max_debt_service','action_info','rule_info','manual_action_status']
    column_labels = dict(id='Naira ID')
    can_edit = False
    can_delete = False
    can_create = False
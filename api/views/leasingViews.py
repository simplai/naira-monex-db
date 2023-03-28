from views.generic import GenericModelView
from models.AdminAggrupationOptionModel import AdminAggrupationOption
from models.AdminDiscretizationConditionModel import AdminDiscretizationCondition
from models.AdminScoreOptionModel import AdminScoreOption
from models.AdminConditionModel import AdminCondition
from sqlalchemy import func

class AdminLeasingDiscretizationView(GenericModelView):
    def get_query(self):
      return self.session.query(self.model).filter(self.model.pyme_leasing==True)

    def get_count_query(self):
      return self.session.query(func.count('*')).filter(self.model.pyme_leasing==True)

    column_display_pk = True
    column_filters = ('id', 'name')
    column_list = ['id','name', 'description', 'pyme_leasing', 'field', 'conditions']
    can_view_details = True
    inline_models = [AdminDiscretizationCondition]
    column_hide_backrefs = False
    column_default_sort = 'id'

class AdminLeasingAggrupationView(GenericModelView):
    def get_query(self):
      return self.session.query(self.model).filter(self.model.router=="leasing")

    def get_count_query(self):
      return self.session.query(func.count('*')).filter(self.model.router=="leasing")

    column_display_pk = True
    column_filters = ('id', 'name')
    column_list = ['id','name', 'description', 'router', 'field', 'options']
    can_view_details = True
    inline_models = [AdminAggrupationOption]
    column_hide_backrefs = False
    column_default_sort = 'id'

class AdminLeasingScoreRuleView(GenericModelView):
    def get_query(self):
      return self.session.query(self.model).filter(self.model.pyme_leasing==True)

    def get_count_query(self):
      return self.session.query(func.count('*')).filter(self.model.pyme_leasing==True)
    
    column_display_pk = True
    column_filters = ('id', 'name')
    column_list = ['id','name', 'description', 'pyme_leasing', 'weight', 'field', 'options']
    can_view_details = True
    inline_models = [AdminScoreOption]
    column_hide_backrefs = False
    column_default_sort = 'id'

class AdminLeasingRuleView(GenericModelView):
    def get_query(self):
      return self.session.query(self.model).filter(self.model.pyme_leasing==True)

    def get_count_query(self):
      return self.session.query(func.count('*')).filter(self.model.pyme_leasing==True)
    
    column_display_pk = True
    column_filters = ('id', 'name')
    # form_excluded_columns = ['conditions']
    can_view_details = True
    column_list = ['id','name','description','actions','conditions']
    details_modal = True
    inline_models = [AdminCondition]
    column_hide_backrefs = False
    column_default_sort = 'id'

    form_rules = ('name','description','pyme_leasing','order','actions','conditions')
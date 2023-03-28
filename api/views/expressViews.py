from views.generic import GenericModelView
from models.AdminAggrupationOptionModel import AdminAggrupationOption
from models.AdminDiscretizationConditionModel import AdminDiscretizationCondition
from models.AdminScoreOptionModel import AdminScoreOption
from models.AdminConditionModel import AdminCondition
from sqlalchemy import func

class AdminExpressDiscretizationView(GenericModelView):
    def get_query(self):
      return self.session.query(self.model).filter(self.model.pyme_express==True)

    def get_count_query(self):
      return self.session.query(func.count('*')).filter(self.model.pyme_express==True)

    column_display_pk = True
    column_filters = ('id', 'name')
    column_list = ['id','name', 'description', 'pyme_express', 'field', 'conditions']
    can_view_details = True
    inline_models = [AdminDiscretizationCondition]
    column_hide_backrefs = False
    column_default_sort = 'id'

    form_rules = ('name','description','field','target','pyme_express','conditions')

class AdminExpressAggrupationView(GenericModelView):
    def get_query(self):
      return self.session.query(self.model).filter(self.model.router=="express")

    def get_count_query(self):
      return self.session.query(func.count('*')).filter(self.model.router=="express")

    column_display_pk = True
    column_filters = ('id', 'name')
    column_list = ['id','name', 'description', 'router', 'field', 'options']
    can_view_details = True
    inline_models = [AdminAggrupationOption]
    column_hide_backrefs = False
    column_default_sort = 'id'

class AdminExpressScoreRuleView(GenericModelView):
    def get_query(self):
      return self.session.query(self.model).filter(self.model.pyme_express==True)

    def get_count_query(self):
      return self.session.query(func.count('*')).filter(self.model.pyme_express==True)
    
    column_display_pk = True
    column_filters = ('id', 'name')
    column_list = ['id','name', 'description', 'pyme_express', 'weight', 'field', 'options']
    can_view_details = True
    inline_models = [AdminScoreOption]
    column_hide_backrefs = False
    column_default_sort = 'id'

    form_rules = ('name','description','pyme_express','weight','field','options')

class AdminExpressRuleView(GenericModelView):
    def get_query(self):
      return self.session.query(self.model).filter(self.model.pyme_express==True)

    def get_count_query(self):
      return self.session.query(func.count('*')).filter(self.model.pyme_express==True)
    
    column_display_pk = True
    column_filters = ('id', 'name')
    # form_excluded_columns = ['conditions']
    can_view_details = True
    column_list = ['id','name', 'order', 'description','actions','conditions']
    details_modal = True
    inline_models = [AdminCondition]
    column_hide_backrefs = False
    column_default_sort = 'id'

    form_rules = ('name','description','pyme_express','order','actions','conditions')


from flask_admin import AdminIndexView
from flask_admin.contrib.sqla import ModelView
from flask_security import current_user
from flask import url_for, redirect

class GenericModelView(ModelView):
    def is_accessible(self):
        if current_user.roles and (current_user.roles[0] in ['gestor','admin']):
            return (current_user.is_active)

    def _handle_view(self, name):
        if not self.is_accessible():
            return redirect(url_for('security.login'))

class MyAdminIndexView(AdminIndexView):
    def is_accessible(self):
        return current_user.is_authenticated # This does the trick rendering the view only if the user is authenticated
    def _handle_view(self, name):
        if not self.is_accessible():
            return redirect(url_for('security.login'))

# Admin view (logged and admin)
class AdminModelView(ModelView):
    def is_accessible(self):
         if current_user.roles and (current_user.roles[0] in ['admin']):
            return True
            # return (current_user.is_active)

    def _handle_view(self, name):
        if not self.is_accessible():
            return redirect(url_for('security.login'))
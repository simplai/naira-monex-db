from api import db
from flask_security import UserMixin
from flask_security.utils import hash_password, _security, get_hmac, _pwd_context

# Support table for Many-to-Many relation User-Role
role_user = db.Table('role_user',
        db.Column('user_id', db.Integer(), db.ForeignKey('users.id')),
        db.Column('role_id', db.Integer(), db.ForeignKey('role.id')))

class User(db.Model, UserMixin):

    def __repr__(self):
        return '<User %s %s>' % (self.user, self.email)

    __tablename__ = "users"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=False, nullable=False)
    user = db.Column(db.String, unique=False, nullable=False)
    email = db.Column(db.String, unique=False, nullable=False)
    password = db.Column(db.String, unique=False, nullable=False)
    active = db.Column(db.Boolean, unique=False, nullable=False)
    authenticated = db.Column(db.Boolean, default=False) # posiblemente no sirva de nada
    roles = db.relationship('Role', secondary=role_user, backref=db.backref('users', lazy='dynamic'))
    last_action = db.Column(db.DateTime, unique=False, nullable=True)

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

    def check_password(self, password):
        return _pwd_context.verify(get_hmac(password), self.password)

    # def is_active(self):
    #     """True, as all users are active."""
    #     return True

    # def get_id(self):
    #     """Return the email address to satisfy Flask-Login's requirements."""
    #     return self.id

    # def is_authenticated(self):
    #     """Return True if the user is authenticated."""
    #     return True
    #     return self.authenticated

    # def is_anonymous(self):
    #     """False, as anonymous users aren't supported."""
    #     return False

    # Custom User Payload
    def get_security_payload(self):
        return {
            'id': self.id,
            'name': self.name,
            'email': self.email
        }

    # @property
    # def serialized(self):
    #     """Return object data in serializeable format"""
    #     return {
    #         'id': self.id,
    #         'name': self.name,
    #         'email': self.email
    #     }

import os

class Config(object):
    DEBUG = False
    TESTING = False

class ProductionConfig(Config):
    DEBUG = False
    TESTING = False
    FLASK_ENV = 'production'
    SQLALCHEMY_DATABASE_URI = "postgresql://admin:s3cr3tPassW00rd@localhost:5432/naira"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_ECHO = False
    API_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2NDgwNTYxMDQsImV4cCI6MTY3OTU5MjEwNCwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.ixSicGfTAgomJUDhK8JK8eveQKUWid1IBA_iBpkVP8g"
    FLASK_ADMIN_SWATCH = "flatly"
    SECURITY_PASSWORD_SALT = "asldkcañsociyap9we8fqp92c3rhñqwen"
    SECURITY_POST_LOGIN_VIEW = "login/"
    SECURITY_POST_LOGIN_VIEW = "admin/"
    SECURITY_REGISTERABLE = False
    SECURITY_SEND_REGISTER_EMAIL = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    JWT_SECRET_KEY = 'asdccASX-CLZ<XOLC7CV7YASDLJsklsksnhccn-.QWEF-LWDOUSOIXAC'
    JWT_ACCESS_TOKEN_EXPIRES = False
    WTF_CSRF_ENABLED = False

class DevelopmentConfig(Config):
    DEBUG = True
    TESTING = False
    FLASK_ENV = 'development'
    # SQLALCHEMY_DATABASE_URI = "postgresql://admin:s3cr3tPassW00rd@naira-pontio-db-1:5432/naira"
    # SQLALCHEMY_DATABASE_URI = "postgresql://admin:s3cr3tPassW00rd@0.0.0.0:5432/naira"
    SQLALCHEMY_DATABASE_URI = "postgresql://admin:s3cr3tPassW00rd@localhost:5432/naira"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_ECHO = True
    API_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2NDgwNTYxMDQsImV4cCI6MTY3OTU5MjEwNCwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.ixSicGfTAgomJUDhK8JK8eveQKUWid1IBA_iBpkVP8g"
    FLASK_ADMIN_SWATCH = "flatly"
    SECURITY_PASSWORD_SALT = "asldkcañsociyap9we8fqp92c3rhñqwen"
    SECURITY_POST_LOGIN_VIEW = "/login/"
    SECURITY_POST_LOGIN_VIEW = "/admin/"
    SECURITY_REGISTERABLE = False
    SECURITY_SEND_REGISTER_EMAIL = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    JWT_SECRET_KEY = 'asdccASX-CLZ<XOLC7CV7YASDLJsklsksnhccn-.QWEF-LWDOUSOIXAC'
    JWT_ACCESS_TOKEN_EXPIRES = False
    WTF_CSRF_ENABLED = False

class TestingConfig(Config):
    TESTING = True
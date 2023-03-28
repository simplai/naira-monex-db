from marshmallow import Schema, fields
from marshmallow.validate import Length, Range

class UserSchema(Schema):
    name = fields.Str(required=True, validate=Length(max=60))
    email = fields.Str(required=(True), validate=Length(max=60, error='email must be a string shorter than 60 letters.'))
    user = fields.Str(required=True, validate=Length(max=60))
    password = fields.Str(required=True, validate=Length(max=60))
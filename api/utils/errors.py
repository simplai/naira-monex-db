import traceback
from flask import jsonify
from functools import wraps
from marshmallow import ValidationError
from sqlalchemy.exc import OperationalError
from json.decoder import JSONDecodeError
from utils.Logger import Logger

logger = Logger('logs')

def handle_exceptions(func):
    origin = func.__name__
    @wraps(func)
    def wrapper(*args, **kwargs):
        exception_handlers = {
            ValidationError: {
                "status_code": 400,
                "exception_name": "ValidationError"
            },
            JSONDecodeError: {
                "status_code": 400,
                "exception_name": "JSONDecodeError"
            },
            OperationalError: {
                "status_code": 500,
                "exception_name": "OperationalError"
            },
            ConnectionError: {
                "status_code": 500,
                "exception_name": "ConnectionError"
            },
            TimeoutError: {
                "status_code": 408,
                "exception_name": "TimeoutError"
            },
            ValueError: {
                "status_code": 500,
                "exception_name": "ValueError"
            },
            KeyError: {
                "status_code": 500,
                "exception_name": "KeyError"
            },
            TypeError: {
                "status_code": 500,
                "exception_name": "TypeError"
            },
            AttributeError: {
                "status_code": 500,
                "exception_name": "AttributeError"
            },
            Exception: {
                "status_code": 500,
                "exception_name": "Exception"
            }
        }
        try:
            return func(*args, **kwargs)
        except Exception as ex:
            for exception_type, handler in exception_handlers.items():
                if isinstance(ex, exception_type):
                    return message(origin, handler, ex)
            
    return wrapper

def message(origin:str, handler: str, ex):
    tb = traceback.extract_tb(ex.__traceback__)
    filename, line_no, func_name, message = tb[-1]
    error = ex.normalized_messages() if hasattr(ex, "normalized_messages") and callable(ex.normalized_messages) else str(ex)
    logger.logError({
        "origin": origin,
        "exception": handler["exception_name"],
        "error": error,
        "filename": filename,
        "line_no": line_no,
        "func_name": func_name,
        "message": message
    }, handler)
    response = {
        "error": error,
        "message": message
    }
    return jsonify(response), handler["status_code"]
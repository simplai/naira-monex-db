RuleHistorySchema = {
    "type": "object",
    "properties": {
        "id": {"type": "integer"},
        "name": {"type": "string"},
        "match": {"type": "boolean"},
        "status": {"type": ["string", "null"]},
        "conditions": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "min": {"type": ["number", "null"]},
                    "max": {"type": ["number", "null"]},
                    "allowed": {"type": ["array", "null"], "items": {"type": "string"}},
                    "allowed_na": {"type": "boolean"},
                    "field": {"type": "string"},
                    "value": {"type": ["string", "null"]},
                    "status": {"type": ["boolean", "null"]}
                },
                "required": ["min", "max", "allowed", "allowed_na", "field", "value", "status"]
            }
        }
    },
    "required": ["id", "name", "match", "conditions"],
    "additionalProperties": False
}

ScoreHistorySchema = {
    "type": "object",
    "properties": {
        "id": {"type": "integer"},
        "name": {"type": "string"},
        "weight": {"type": "number"},
        "use_field_value": {"type": "boolean"},
        "score": {"type": ["number", "null"]},
        "conditions": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "min": {"type": ["number", "null"]},
                    "max": {"type": ["number", "null"]},
                    "use_field_value": {"type": "boolean"},
                    "ratio": {"type": "number"},
                    "value": {"type": ["string", "null"]},
                    "score": {"type": "number"}
                },
                "required": ["min", "max", "use_field_value", "ratio", "value", "score"]
            }
        }
    },
    "required": ["id", "name", "weight", "use_field_value", "score", "conditions"],
    "additionalProperties": False
}

AggrupationHistorySchema = {
    "type": "object",
    "properties": {
        "id": {"type": "integer"},
        "name": {"type": "string"},
        "router": {"type": "string"},
        "conditions": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "field": {"type": "string"},
                    "percentage": {"type": "number"}
                },
                "required": ["field", "percentage"]
            }
        }
    },
    "required": ["id", "name", "router", "conditions"],
    "additionalProperties": False
}

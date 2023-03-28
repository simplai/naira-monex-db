from datetime import datetime
import json

class Logger():
    def __init__(self, path):
        self.path = path

    def logTo(self, naira_id, text, category = 'GENERAL'):
        self.log(text,category,naira_id)
    
    def log(self, text, category = 'GENERAL', naira_id = 0):
        date = datetime.today().strftime('%Y-%m-%d')
        f = open(f'{self.path}/{date}.log','a')
        string = f'{datetime.now()} - [creditAPP:{naira_id}]-[{category}]: {text}\n'
        f.write(f'{string}')

    def logError(self, json_data, handler):
        date = datetime.today().strftime('%Y-%m-%d')
        f = open(f'{self.path}/{date}-errors.log','a')
        string = f'{datetime.now()} - [{json_data["origin"]}()-{json_data["func_name"]}(): {handler["status_code"]}][File:{json_data["filename"]}/Line:{json_data["line_no"]}]:\n'
        f.write(f'{string}')
        string = f'{json.dumps(json_data, indent=2)}\n'
        f.write(f'{string}')

    def logJson(self, text, type, naira_id):
        date = datetime.today().strftime('%Y-%m-%d')
        f = open(f'{self.path}/creditApp/{date}.log','a')
        string = f'{datetime.now()} - [creditAPP:{naira_id}]-[{type}]:\n'
        f.write(f'{string}')
        string = f'{json.dumps(json.loads(text), indent=2)}\n'
        f.write(f'{string}')
        
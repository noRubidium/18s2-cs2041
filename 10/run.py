from flask import Flask,jsonify,json, request, send_from_directory
from flask_cors import CORS
app = Flask(__name__)
CORS(app)

class State(object):
    """docstring for State"""
    def __init__(self):
        super(State, self).__init__()
        self.todos = []
        self.gid = 0

    def add_todo(self, s):
        _id = self.gid
        self.gid += 1
        self.todos.insert(0, { '_id': _id , 'content': s })
        return _id

    def delete_todo(self, _id):
        self.todos = list(filter(lambda x : x['_id'] != int(_id), self.todos))

state = State()

@app.route("/todos")
def get_todos():
    return jsonify(todos=state.todos)

@app.route("/todos/add", methods=['POST'])
def add_todo():
    global gid
    new_todo = request.get_json()
    _id = state.add_todo(new_todo)
    return jsonify(_id=_id)

@app.route("/todos/delete/<_id>", methods=['POST'])
def delete_todo(_id):
    print(_id)
    state.delete_todo(_id)
    return jsonify(_id=_id)

@app.route('/js/<path:path>')
def send_js(path):
    return send_from_directory('js', path)


if __name__ == "__main__":
    app.run()

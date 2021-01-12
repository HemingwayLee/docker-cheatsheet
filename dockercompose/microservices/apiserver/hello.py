import os
from flask import Flask, jsonify, make_response
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'


@app.route('/env')
def hello_abc():
    print(f"server {os.environ.get('FOOBAR', 'No env')} is invoked")

    responseBody = { "server_name": os.environ.get('FOOBAR', 'No env') }
    return make_response(jsonify(responseBody), 200)


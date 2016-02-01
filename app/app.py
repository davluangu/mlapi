from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/')
def index():
    return 'hey there!'


@app.route('/data')
def names():
    data = {"names": ["John", "Jacob", "Julie", "Jennifer"]}
    return jsonify(data)


if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 8000, debug = False)

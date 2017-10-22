from flask import Flask
from flask import jsonify

app = Flask(__name__)


@app.route("/")
def home_index():
    return jsonify({'api_version': '1'}), 200


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)

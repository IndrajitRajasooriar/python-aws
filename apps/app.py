from flask import Flask, render_template
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def home():
    return render_template(
        "home.py",
        date=datetime.now()
    )

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
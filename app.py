import os
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def home():
    env = os.environ.get('ENVIRONMENT', 'UNKNOWN')
    #return f"Hello from {env} environment!"
    return render_template('index.html', environment=env)


@app.route('/health')
def health():
    return "OK", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
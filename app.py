from flask import Flask, render_template, url_for

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/contactus')
def contactus():
    return render_template('contactus.html')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')

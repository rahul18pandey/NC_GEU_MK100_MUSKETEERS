## server page  ##
from flask import Flask, render_template, request, jsonify, make_response, json
app = Flask(__name__)


@app.route('/')
@app.route('/home', methods=['GET'])
def homPage():
    return render_template('startpage.html', title = 'Saksham Kisan - HOME', user="na") #other users could be "kisan", "sprovider", "buyer"


@app.route('/login', methods=["GET", "POST"])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        return  "hi "+email
    return render_template('login.html', title = 'Saksham Kisan - LOGIN')
@app.route('/signup', methods=["GET", "POST"])
def signup():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        return  "hi "+email
    return render_template('signup.html', title = 'Saksham Kisan - REGISTER')


#########################################################
#####################   FARMER HOME   ###################
#########################################################

@app.route('/farmerhome', methods=['GET'])
def farmerhome():
    return render_template('farmerhome.html', title = 'Saksham Kisan - HOME', user="farmer") #other users could be "kisan", "sprovider", "buyer"





#########################################################
#####################   BUYER HOME   ####################
#########################################################


@app.route('/buyerhome', methods=['GET'])
def buyerhome():
    return render_template('buyerhome.html', title = 'Saksham Kisan - HOME', user="buyer") #other users could be "kisan", "sprovider", "buyer"


@app.route('/bigbuyerprofile', methods=['GET'])
def bigbuyerprofile():
    return render_template('bigbuyerprofile.html', title = 'Saksham Kisan - HOME', user="bigbuyer") #other users could be "kisan", "sprovider", "buyer"


if __name__ == '__main__': 
    app.run(debug=True) 
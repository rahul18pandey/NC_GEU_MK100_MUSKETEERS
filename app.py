from flask import Flask, render_template, request, jsonify, make_response, json
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Use a service account
cred = credentials.Certificate('./firepy-7e705-firebase-adminsdk-iffv4-ab6fbe1767.json')
firebase_admin.initialize_app(cred)

db = firestore.client()
app = Flask(__name__)


def login_auth():
    pass


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


@app.route('/farmerprofile', methods=['GET'])
def farmerprofile():
    return render_template('farmerprofile.html', title = 'Saksham Kisan - HOME', user="farmer") #other users could be "kisan", "sprovider", "buyer"


@app.route('/farmersell', methods=['GET'])
def farmersell():
    return render_template('farmersell.html', title = 'Saksham Kisan - SELL', user="farmer") #other users could be "kisan", "sprovider", "buyer"

@app.route('/schemes', methods=['GET'])
def schemes():
    return render_template('schemes.html', title = 'Saksham Kisan - SCHEMES', user="farmer") #other users could be "kisan", "sprovider", "buyer"

@app.route('/tutorials', methods=['GET'])
def tutorials():
    return render_template('tutorials.html', title = 'Saksham Kisan - TURORIAL', user="farmer") #other users could be "kisan", "sprovider", "buyer"


##############  farmer auction  #############
@app.route('/farmerauction', methods=['GET'])
def farmerauction():
    return render_template('farmerauction.html', title = 'Saksham Kisan - AUCTION', user="farmer") #other users could be "kisan", "sprovider", "buyer"

@app.route('/farmerbidding', methods=['GET'])
def farmerbidding():
    docid = request.args.get('id')
    if docid:
        return render_template('farmerbidding.html', id = docid , title = 'Saksham Kisan - BIDDING') #other users could be "kisan", "sprovider", "buyer"
    else:
        return render_template('farmerauction.html', title = 'Saksham Kisan - AUCTION') #other users could be "kisan", "sprovider", "buyer"

@app.route('/farmerpayment', methods=['GET'])
def farmerpayment():
    buyer_email = request.args.get('buyer_email')
    current_bid = request.args.get('current_bid')
    croptype = request.args.get('croptype')
    return render_template('farmerpayment.html', title = 'Saksham Kisan - PAYMENT', user="farmer",buyer = buyer_email, bidvalue = current_bid, crop = croptype) #other users could be "kisan", "sprovider", "buyer"



#########################################################
#####################   BUYER HOME   ####################
#########################################################


@app.route('/buyerhome', methods=['GET'])
def buyerhome():
    return render_template('buyerhome.html', title = 'Saksham Kisan - HOME', user="buyer") #other users could be "kisan", "sprovider", "buyer"



@app.route('/bigbuyerprofile', methods=['GET'])
def bigbuyerprofile():
    return render_template('bigbuyerprofile.html', title = 'Saksham Kisan - HOME', user="bigbuyer") #other users could be "kisan", "sprovider", "buyer"

@app.route('/localbuyerprofile', methods=['GET'])
def localbuyerprofile():
    return render_template('localbuyerprofile.html', title = 'Saksham Kisan - HOME', user="localbuyer") #other users could be "kisan", "sprovider", "buyer"

@app.route('/mandibuyerprofile', methods=['GET'])
def mandibuyerprofile():
    return render_template('mandibuyerprofile.html', title = 'Saksham Kisan - HOME', user="mandibuyer") #other users could be "kisan", "sprovider", "buyer"

@app.route('/buyerbuy', methods=['GET'])
def buyerbuy():
    return render_template('buyerbuy.html', title = 'Saksham Kisan - BUY', user="buyer") #other users could be "kisan", "sprovider", "buyer"

@app.route('/upload', methods=['GET'])
def upload():
    id = request.args.get('id')
    return render_template('upload.html', title = 'Saksham Kisan - UPLOAD', user="buyer", userid= id) #other users could be "kisan", "sprovider", "buyer"



########  buyer auction ##########

@app.route('/buyerauction', methods=['GET'])
def buyerauction():
    return render_template('buyerauction.html', title = 'Saksham Kisan - AUCTION', user="buyer") #other users could be "kisan", "sprovider", "buyer"

@app.route('/buyerbidding', methods=['GET'])
def buyerbidding():
    docid = request.args.get('id')
    if docid:
        return render_template('buyerbidding.html', id = docid , title = 'Saksham Kisan - BIDDING') #other users could be "kisan", "sprovider", "buyer"
    else:
        return render_template('buyerauction.html', title = 'Saksham Kisan - AUCTION') #other users could be "kisan", "sprovider", "buyer"





######################################################
##################  service provider  ################
######################################################

@app.route('/servicehome', methods=['GET'])
def servicehome():
    return render_template('servicehome.html', title = 'Saksham Kisan - HOME', user="SERVICE") #other users could be "kisan", "sprovider", "buyer"

@app.route('/serviceprofile', methods=['GET'])
def serviceprofile():
    return render_template('serviceprofile.html', title = 'Saksham Kisan - PROFILE', user="SERVICE") #other users could be "kisan", "sprovider", "buyer"

@app.route('/serviceaddservices', methods=['GET'])
def serviceaddservices():
    return render_template('serviceaddservices.html', title = 'Saksham Kisan - ADD', user="SERVICE") #other users could be "kisan", "sprovider", "buyer"













# chat added
@app.route('/chat', methods=['GET'])
def chat():
    user = request.args.get('user')
    return render_template('chat.html', title = 'Saksham Kisan - ', userid = user) #other users could be "kisan", "sprovider", "buyer"






############### api
@app.route('/api', methods=['GET'])
def api():
    docs = db.collection(u'Farmer').stream()
    data = []
    for doc in docs:
        print(doc.to_dict())
        data.append("ASDF")
    return data





if __name__ == '__main__': 
    app.run(host= '0.0.0.0', port=9000, debug=True) 

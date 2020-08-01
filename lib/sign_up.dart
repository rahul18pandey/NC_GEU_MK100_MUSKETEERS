import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'usertype.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
FirebaseUser user;
class _SignUpPageState extends State<SignUpPage> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              width: size.width * 0.4,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/login_bottom.png',
              width: size.width * 0.45,
            ),
          ),
        SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50,),
                  Container(
                    //margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    height: 200,
                    child: Image(image: AssetImage('assets/images/icon.png',)),
                  ),

                  SizedBox(height: 20,),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: Text(
                          "Sign Up",
                          style:
                          TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 60,
                      child: TextFormField(
                        validator: validateEmail,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15.0),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.teal,
                            size: 30,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: kHintTextStyle,
                        ),
                        onSaved: (input) => _email = input,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4.0),
                    child: Container(
                      decoration: kBoxDecorationStyle,
                      height: 60,
                      child: TextFormField(
                        validator: validatePassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(18.0),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.teal,
                            size: 30,
                          ),
                          hintText: 'Enter your Password',
                          hintStyle: kHintTextStyle,
                        ),
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      padding: const EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                      color: Colors.yellow,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0))),
                      onPressed: signUp,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Sign Up".toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          const SizedBox(width: 40.0),
                          Icon(
                            Icons.arrow_forward,
                            size: 18.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already Registered?",style: TextStyle(fontSize: 20),),
                      FlatButton( child: Text("Sign in!",style: TextStyle(fontSize: 20,color: Colors.blue),),
                        onPressed: (){
                          Navigator.pop(context);
                        },)
                    ],
                  )
                ],
              )
          ),
        ),
        ],),
    );
  }
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
  String validatePassword(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 6)
      return 'Password must be of atleast 6 digit';
    else
      return null;
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      showLoadingDialog(context, _keyLoader);
      try{
        AuthResult result= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user = result.user;
        Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserPage()));
      }catch(e){
        print (e.message);
        _addDialog(context,e.message);
      }
    }
  }
  _addDialog(BuildContext context,String message){
    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 25, right: 25,top: 10),
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Container(
                      child: new Text("${message}"),
                    ),

                  ],
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();

                },
              ),
            ],
          );
        }
    );
  }
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }
}
final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
class farmeradd{
  String email;
  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser()!=null){
      return true;
    }else{
      return false;
    }
  }

  Future<void>getCurrentUID()async{
    print((await _firebaseAuth.currentUser()).email);
  }

  Future<void>addData(userData)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Farmer').document(user.email).setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addData1(userData)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Buyer').document(user.email).setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }

  Future<void>addData2(userData)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Service').document(user.email).setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  getData() async {
    return await Firestore.instance.collection('Buyer').getDocuments();
  }
}



import 'dart:io';
//import 'dart:js';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'usertype.dart';

import 'Constants/loading.dart';
import 'crud.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'package:flutter/material.dart';
import 'constants.dart';
import 'sign_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}
FirebaseUser user;

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String _email, _password;
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  crudMethods crudObj = new crudMethods();
  QuerySnapshot buyersdata;
  QuerySnapshot farmersdata;
  QuerySnapshot servicedata;
  String a;

@override
  void initState() {
  _checkInternetConnectivity();
  Future.delayed(Duration(seconds: 5),()
  {
    crudObj.getData().then((results) {
      setState(() {
        buyersdata = results;
      });
    });
    crudObj.getFarmerData().then((results) {
      setState(() {
        farmersdata = results;
      });
    });
    crudObj.getServiceData().then((results) {
      setState(() {
        servicedata = results;
      });
    });
    super.initState();
  });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
  if(farmersdata!=null && servicedata!=null && buyersdata!=null) {

    return  WillPopScope(
     // onWillPop: () async {
       // return await DialogHelper.exit(context);
      //},
      child: Scaffold(
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
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
               child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icon.png',
                            width: 200,
                            height: 200,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Stack(
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text(
                              "Log In",
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
                              contentPadding: EdgeInsets.all(20.0),
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
                          onPressed: () {
                            _handleSubmit(context);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Sign In".toUpperCase(),
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
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("New User here?",style: TextStyle(fontSize: 20),),
                            FlatButton( child: Text("Sign Up!",style: TextStyle(fontSize: 20,color: Colors.blue),),
                              onPressed: (){
                                _checkInternetConnectivity();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                              },)
                          ],
                        ),
                      )
                    ],
                  )
          ),
             ),
           ),
          ],),
      ),
    );
  }else{
    return Scaffold(
        body: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: height/3)),
            SpinKitWave(
              color: Colors.blue,
              type: SpinKitWaveType.center,

            ),
            ColorizeAnimatedTextKit(
              text: ['Saksham Kisan'],

              colors: [
                Colors.purple,
                Colors.blue,
                Colors.yellow,
                Colors.red,
              ],

              textAlign: TextAlign.center,
              //alignment: AlignmentDirectional.topStart,
              textStyle: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  fontFamily:'Rowdies'
              ),

            ),

          ],

        )
    );
  }
  }
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {

      return 'Enter Valid Email';
    }
    else {

      return null;
    }
  }
  String validatePassword(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 6) {

      return 'Password must be of atleast 6 digit';
    }
    else {

      return null;
    }
  }
  _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      showDialog(context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("No Internet"),
              content: Text("You're not connected to Internet!"),
              actions: <Widget>[
                FlatButton(child: Text("Ok"), onPressed: () {
                  exit(0);
                },),
              ],
            );
          }
      );
    }
  }

  _addDialog(BuildContext context){
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
                    Container(
                      child: new Text("Invalid Email or Password."),
                    ),
                    Container(
                      child: new Text("Please provide correct credentials."),
                    )

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
  Future<void> _handleSubmit(BuildContext context) async {
    try {

     //invoking login
       if(_formKey.currentState.validate()){
         _formKey.currentState.save();
         showLoadingDialog(context, _keyLoader);
         try{
           AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
           _saveDeviceToken(_email);
           user = result.user;
           a=user.email;
           print(a);

           for(int i=0;i<buyersdata.documents.length;i++)
           {

             if(a==buyersdata.documents[i].documentID)
             {

               if("local"==buyersdata.documents[i].data['Type'])
               {
                Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                 //Navigator.push(context, MaterialPageRoute(builder: (context) => BuyerHomeScreen()));
                 break;
               }
               else if("mandi"==buyersdata.documents[i].data['Type'])
               {
                 Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MandiBuyerHome()));
                 break;
               }
               else if("big"==buyersdata.documents[i].data['Type'])
               {
                Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>BigBuyerHome()));
                 break;
               }
             }
           }


           for(int j=0;j<farmersdata.documents.length;j++)
           {

             if(a==farmersdata.documents[j].documentID)
             {
               Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
               //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
               break;
             }
             else
             {
               Loading();
             }
           }

           for(int j=0;j<servicedata.documents.length;j++)
           {

             if(a==servicedata.documents[j].documentID)
             {
             Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();

              // Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceHomeScreen()));
               break;
             }
             else
             {
               Loading();
             }
           }
         } catch(e){
           _addDialog(context);

           return (e.message);
         }

       }
     //close the dialoge

    } catch (error) {
      Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
      print(error);
    }
  }
  _saveDeviceToken(String useremail) async {
    // Get the current user
    // FirebaseUser user = await _auth.currentUser();

    // Get the token for this device
    String fcmToken = await _fcm.getToken();

    // Save it to Firestore
    if (fcmToken != null) {
      var tokens = _db
          .collection('User Token')
          .document(useremail);

      await tokens.setData({
        'token': fcmToken,
        'createdAt': DateTime.now().toIso8601String().toString(), // optional
        'platform': Platform.operatingSystem // optional
      });
    }
  }



}



class userinfo{
  getUserEmail(){
    return user;
  }
}

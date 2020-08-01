import 'package:flutter/material.dart';
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/main_top.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.4,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/login_bottom.png',
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.45,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Container(
                        //margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        height: 200,
                        child: Image(
                            image: AssetImage('assets/images/icon.png',)),
                      ),

                      SizedBox(height: 20,),
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 32.0),
                            child: Text(
                              "Sign Up",
                              style:
                              TextStyle(
                                  fontSize: 30.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15.0),
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.teal,
                                size: 30,
                              ),
                              hintText: 'Enter your Email',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4.0),
                        child: Container(
                          height: 60,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(18.0),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.teal,
                                size: 30,
                              ),
                              hintText: 'Enter your Password',
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),

                      SizedBox(height: 30,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          padding: const EdgeInsets.fromLTRB(
                              40.0, 16.0, 30.0, 16.0),
                          color: Colors.yellow,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Sign Up".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
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
                          Text("Already Registered?",
                            style: TextStyle(fontSize: 20),),
                          FlatButton(child: Text("Sign in!", style: TextStyle(
                              fontSize: 20, color: Colors.blue),),
                            onPressed: () {
                              Navigator.pop(context);
                            },)
                        ],
                      )
                    ],
                  )
              ),
            ),
          ),
        ],),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:sih2020/sign_up.dart';
import 'sign_in.dart';
import 'constants.dart';


class BuyerPage extends StatefulWidget {
  @override
  _BuyerPageState createState() => _BuyerPageState();
}

class _BuyerPageState extends State<BuyerPage> {
  String type='';
  String aadhar='';
  String address='';
  String city='';
  String district='';
  String email='';
  String name='';
  String phone='';
  String pin='';
  String state='';
  String GST='';
  String license='';
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  farmeradd fobj = new farmeradd();
  void fetchGST(String GST1) async {
    var url = 'https://appyflow.in/api/verifyGST?gstNo=${GST1}&key_secret=ci79UjISXzd35qUxrsd2Vtmtejr1';
    var response = await get(url);
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      if(notesJson['error']==true) {

        NotValid(context,notesJson['message']);
      }
      else{

        fobj.addData1({
          'Name': this.name,
          'Phone': this.phone,
          'Pin': this.pin,
          'Address': this.address,
          'State':this.state,
          'City': this.city,
          'Type':"mandi",
          'District':this.district,
          'Email':this.email,
          'GST':this.GST,
          'License':this.license,
        }).then((result) {
          Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
          Fluttertoast.showToast(
            msg: "Sign up successful",
            toastLength: Toast.LENGTH_LONG,
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }).catchError((e) {
          print(e);
        });


      }
    }
  }
  void fetchGST1(String GST1) async {
    var url = 'https://appyflow.in/api/verifyGST?gstNo=${GST1}&key_secret=ci79UjISXzd35qUxrsd2Vtmtejr1';
    var response = await get(url);
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);

      if(notesJson['error']==true) {

        NotValid(context,notesJson['message']);
      }
      else{
        fobj.addData1({
          'GST': this.GST,
          'Phone': this.phone,
          'Pin': this.pin,
          'Address': this.address,
          'Type':"big",
          'Email':this.email,
          'License':this.license,
          'Name':this.name,
        }).then((result) {
          Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
          Fluttertoast.showToast(
            msg: "Sign up successful",
            toastLength: Toast.LENGTH_LONG,
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        }).catchError((e) {
          print(e);
        });

      }
    }
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Background-image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*.15,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Text("Sign Up as ", style: TextStyle(fontSize: 30,fontFamily: 'Montserrat', fontWeight: FontWeight.w600,color: Colors.white),),
              ),


              FlatButton(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  child: ListTile(
                    title: Text(
                      "Local Buyer",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1.5,
                        fontFamily: 'Montserrat', ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onPressed: () {
                  addDialog1(context);

                },
              ), FlatButton(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  child: ListTile(
                    title: Text(
                      "Mandi Buyer",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1.5,
                        fontFamily: 'Montserrat',),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onPressed: () {
                  addDialog2(context);
                },
              ), FlatButton(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 25),
                  child: ListTile(
                    title: Text(
                      "Big Organization",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1.5,
                        fontFamily: 'Montserrat',),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onPressed: () {
                  addDialog3(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> addDialog1(BuildContext context) async {


    return showDialog(

        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 15, right: 15),
            title: Center(child: Text("Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),

            content: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child:SingleChildScrollView(
                    child:Column(

                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Name';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Name',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.email= input,
                          ),
                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Email';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Email',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.email= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(

                            keyboardType: TextInputType.number,
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Phone number';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Phone Number',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.phone = input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Aadhar';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Aadhar Number',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.aadhar= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Address';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Address',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.address= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide City';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your City',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.city= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide State';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your State',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.state = input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide District';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your District',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.district= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Pin Code';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Pin Code',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.pin= input,

                          ),
                        ),
                      ],
                    ),
                  )

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
              FlatButton(
                child: Text('Add'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  Fluttertoast.showToast(
                    msg: "Sign up successful",
                    toastLength: Toast.LENGTH_LONG,
                  );
                  fobj.addData1({

                    'Phone': this.phone,
                    'Pin': this.pin,
                    'Address': this.address,
                    'State':this.state,
                    'City': this.city,
                    'Type':"local",
                    'District':this.district,
                    'Aadhar':this.aadhar,
                    'Email':this.email,
                    'Name':this.name,

                  }).then((result) {
                    Fluttertoast.showToast(
                      msg: "Sign up successful",
                      toastLength: Toast.LENGTH_LONG,
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

                  }).catchError((e) {
                    print(e);
                  });
                },
              ),

            ],
          );
        }
    );
  }
  Future<bool> addDialog2(BuildContext context) async {


    return showDialog(

        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Center(child: Text("Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),

            content: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child:SingleChildScrollView(
                    child:Column(

                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide name';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Name',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.name= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Email';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Email',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.email= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Phone number';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Phone Number',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.phone = input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide GST';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your GST Number',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.GST= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide License';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your License Number',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.license= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Address';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Address',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.address= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide City';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your City',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.city= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide State';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your State',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.state = input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide District';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your District',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.district= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Pin Code';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Pin Code',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.pin= input,

                          ),
                        ),
                      ],
                    ),
                  )

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
              FlatButton(
                child: Text('Add'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                  showLoadingDialog(context, _keyLoader);
                  fetchGST(this.GST);
                },
              ),

            ],
          );
        }
    );
  }
  Future<bool> addDialog3(BuildContext context) async {


    return showDialog(

        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Center(child: Text("Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),

            content: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child:SingleChildScrollView(
                    child:Column(

                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Name';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Name',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.name= input,
                          ),
                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Email';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Email',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.email= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Phone number';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Phone Number',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.phone = input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide GST';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your GST Number',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.GST= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide License';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your License Number',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.license= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 5),

                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Address';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Address',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.address= input,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          margin: EdgeInsets.symmetric(vertical: 8),

                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide Pin Code';
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: InputBorder.none,
                              hintText: 'Enter your Pin Code',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (input) => this.pin= input,

                          ),
                        ),
                      ],
                    ),
                  )

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
              FlatButton(
                  child: Text('Add'),
                  textColor: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                    showLoadingDialog(context, _keyLoader);
                    fetchGST1(this.GST);
                  }
              ),

            ],
          );
        }
    );
  }
  NotValid(BuildContext context,String message){
    Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 25, right: 25,top: 10),
            content: SingleChildScrollView(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: new Text("unable to register "+message),
                      ),
                    ],
                  ),
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
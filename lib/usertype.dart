import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import 'package:sih2020/sign_up.dart';
import 'sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'buyertype.dart';
import 'crud.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TextEditingController _controller = new TextEditingController();
  var items = ['irrigation', 'fertilizer', 'transport', 'packaging','coldstorage/warehouse'];

  String aadhar='';
  String address='';
  String area='';
  String type='';
  String city='';
  String district='';
  String email='';
  String house='';
  String name='';
  String phone='';
  String pin='';
  String police='';
  String post='';
  String state='';
  String GST='';
  String license='';

  QuerySnapshot cars;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  crudMethods crudObj = new crudMethods();
  farmeradd fobj=new farmeradd();
  void fetchGST(String GST1) async {
    var url = 'https://appyflow.in/api/verifyGST?gstNo=${GST1}&key_secret=ci79UjISXzd35qUxrsd2Vtmtejr1';
    var response = await get(url);
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      if(notesJson['error']==true) {

        NotValid(context,notesJson['message']);
      }
      else{

        fobj.addData2({
          'Name': this.name,
          'Phone': this.phone,
          'Address': this.address,
          'State':this.state,
          'City': this.city,
          'Pin': this.pin,
          'District':this.district,
          'Email':this.email,
          'GST':this.GST,
          'License':this.license,
          'Type':this.type,
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

  NotValid(BuildContext context,String message){
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
                      child: new Text("unable to register"+message),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Background-image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*.15,),


              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text("Sign Up as ",style: TextStyle(fontSize: 30,fontFamily: 'Montserrat', fontWeight: FontWeight.w600,color: Colors.white),),
              ),

              FlatButton(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                    title: Text(
                      "Farmer",
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
                  addDialog(context);
                },
              ),FlatButton(
                child: Card(

                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                    title: Text(
                      "Buyer",
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BuyerPage()));
                },
              ),FlatButton(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ListTile(
                    title: Text(
                      "Service Provider",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> addDialog(BuildContext context) async {


    return showDialog(

        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),

            content: Container(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
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
                        onChanged: (input) => this.name = input,
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
                        onChanged: (input) => this.email = input,
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
                            return 'Provide Aadhar Number';
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
                      margin: EdgeInsets.symmetric(vertical: 8),

                      child: TextFormField(
                        validator: (input) {
                          if(input.isEmpty){
                            return 'Provide Farm Area';
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: InputBorder.none,
                          hintText: 'Enter your Farm Area',
                          hintStyle: kHintTextStyle,
                        ),
                        onChanged: (input) => this.area= input,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      margin: EdgeInsets.symmetric(vertical: 5),

                      child: TextFormField(

                        validator: (input) {
                          if(input.isEmpty){
                            return 'Provide house number';
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: InputBorder.none,
                          hintText: 'Enter your House Number',
                          hintStyle: kHintTextStyle,
                        ),
                        onChanged: (input) => this.house= input,
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
                        onChanged: (input) => this.address = input,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      margin: EdgeInsets.symmetric(vertical: 8),

                      child: TextFormField(
                        validator: (input) {
                          if(input.isEmpty){
                            return 'Provide nearest Police station';
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: InputBorder.none,
                          hintText: 'Enter your Police station',
                          hintStyle: kHintTextStyle,
                        ),
                        onChanged: (input) => this.police = input,
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
                            return 'Provide District';
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: InputBorder.none,
                          hintText: 'Enter your District',
                          hintStyle: kHintTextStyle,
                        ),
                        onChanged: (input) => this.district = input,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      margin: EdgeInsets.symmetric(vertical: 8),

                      child: TextFormField(
                        validator: (input) {
                          if(input.isEmpty){
                            return 'Provide state ';
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: InputBorder.none,
                          hintText: 'Enter your state',
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
                            return 'Provide Post Office';
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: InputBorder.none,
                          hintText: 'Enter your Post Office',
                          hintStyle: kHintTextStyle,
                        ),
                        onChanged: (input) => this.post = input,
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
                  fobj.addData({
                    'Name': this.name,
                    'Phone': this.phone,
                    'Aadhar': this.aadhar,
                    'Address': this.address,
                    'State':this.state,
                    'City': this.city,
                    'Pin_code': this.pin,
                    'District':this.district,
                    'Email':this.email,
                    'House':this.house,
                    'Police':this.police,
                    'Post':this.post,
                    'Area':this.area,

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

            content: Container(
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
                          onChanged: (input) => this.name = input,
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
                          onChanged: (input) => this.email = input,
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
                        margin: EdgeInsets.symmetric(vertical: 8),

                        child: TextFormField(
                          validator: (input) {
                            if(input.isEmpty){
                              return 'Provide GST';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                            hintText: 'Enter your GST number',
                            hintStyle: kHintTextStyle,
                          ),
                          onChanged: (input) => this.GST= input,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        margin: EdgeInsets.symmetric(vertical: 8),

                        child: TextFormField(
                          validator: (input) {
                            if(input.isEmpty){
                              return 'Provide License Number';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                            hintText: 'Enter your License Number',
                            hintStyle: kHintTextStyle,
                          ),
                          onChanged: (input) => this.license = input,
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
                          onChanged: (input) => this.address = input,
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
                              return 'Provide District';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                            hintText: 'Enter your District',
                            hintStyle: kHintTextStyle,
                          ),
                          onChanged: (input) => this.district = input,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        margin: EdgeInsets.symmetric(vertical: 8),

                        child: TextFormField(
                          validator: (input) {
                            if(input.isEmpty){
                              return 'Provide state ';
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: InputBorder.none,
                            hintText: 'Enter your state',
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

                      Container(
                        child: new Column(
                          children: [
                            new Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                      child: new TextField(controller: _controller)
                                  ),
                                  new PopupMenuButton<String>(
                                    icon: const Icon(Icons.arrow_drop_down),
                                    onSelected: (String value) {
                                      _controller.text = value;
                                      this.type=value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items.map<PopupMenuItem<String>>((String value) {
                                        return new PopupMenuItem(child: new Text(value), value: value);
                                      }).toList();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),







                    ],
                  ),
                )

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
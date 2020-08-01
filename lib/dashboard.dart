
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_in.dart';
import 'constants.dart';
import 'crud.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String name;
  String phone;
  String GST;

  String city;
  String license;
  String state;
  String pincode;

  QuerySnapshot cars;



  crudMethods crudObj = new crudMethods();

 Future<bool> addDialog(BuildContext context) async {


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
                  margin: EdgeInsets.symmetric(vertical: 5),

                  child: TextFormField(
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
                        return 'Provide GST number';
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
                        return 'Provide license number';
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
                        return 'Provide Pin Code';
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5.0),
                      border: InputBorder.none,
                      hintText: 'Enter your Pin Code',
                      hintStyle: kHintTextStyle,
                    ),
                    onChanged: (input) => this.pincode= input,
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
               /*  crudObj.addData({
                    'Organization': this.name,
                    'Phone_number': this.phone,
                    'GST': this.GST,
                    'License_Number': this.license,
                    'office_state':this.state,
                    'Office_city': this.city,
                    'Pin_code': this.pincode,

                  }).then((result) {
                    dialogTrigger(context);
                  }).catchError((e) {
                    print(e);
                  });*/
                },
              ),

            ],
          );
        }
    );
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Fields added', style: TextStyle(fontSize: 15.0)),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        cars = results;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    FirebaseUser user= crudObj.getUser();
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
            addDialog(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                crudObj.getData().then((results) {
                  setState(() {
                    cars = results;
                    print(cars);
                  });
                });

              },
            )
          ],
        ),
        body:_userList());
  }
   _userList() {
String a=user.email;
    if (cars != null) {
  for(int i=0;i<cars.documents.length;i++)
    {
      if(a==cars.documents[i].documentID)
        {
          return new ListTile(
            title: Text(cars.documents[i].data['Organization']),
            subtitle: Text(cars.documents[i].data['GST']),
          );
        }
    }
    }
    else {
      return Text('Loading, Please wait..');
    }
  }


}

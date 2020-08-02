import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/crud.dart';
import 'localbuycrop.dart';


class DirectedFarmerLocalProfile extends StatefulWidget {
  @override
  _DirectedFarmerLocalProfileState createState() => _DirectedFarmerLocalProfileState();
}

class _DirectedFarmerLocalProfileState extends State<DirectedFarmerLocalProfile> {
  crudMethods fobj = new crudMethods();
  emailvalafunction e=new emailvalafunction();
  String a;
  QuerySnapshot farmerdata;
  @override
  void initState() {
    fobj.getFarmerData().then((results) {
      setState(() {
        farmerdata = results;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Profile page', textAlign: TextAlign.center,),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.settings_voice),
        backgroundColor: Colors.green,
      ),
      body:_showFarmerProfile(),
    );
  }
  _showFarmerProfile(){
    a=e.getEmail();
    print("Hey");
    print(a);
    if (farmerdata!= null) {
      for(int i=0;i<farmerdata.documents.length;i++)
      {
        if(a==farmerdata.documents[i].documentID)
        {

          return new  Container(

            color: Colors.white,

            child: new ListView(

              children: <Widget>[
                Column(

                  children: <Widget>[
                    new Container(
                      height: 1550.0,
                      color: Colors.white,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: new Text('Farmer Information',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    fontFamily: 'sans-serif-light',
                                    color: Colors.black)),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      new Text(
                                        'Name :',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        farmerdata.documents[i]
                                            .data['Name'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      )


                                    ],
                                  ),
                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      new Text(
                                        'Email :',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        farmerdata.documents[i]
                                            .data['Email'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      )


                                    ],
                                  ),
                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      new Text(
                                        'Phone Number :',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        farmerdata.documents[i]
                                            .data['Phone'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      )


                                    ],
                                  ),
                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      new Text(
                                        'City :',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        farmerdata.documents[i]
                                            .data['City'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      )


                                    ],
                                  ),
                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      new Text(
                                        'District :',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        farmerdata.documents[i]
                                            .data['District'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      )


                                    ],
                                  ),
                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      new Text(
                                        'State :',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        farmerdata.documents[i]
                                            .data['State'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      )


                                    ],
                                  ),
                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      new Text(
                                        'Pin Code :',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        farmerdata.documents[i]
                                            .data['Pin_code'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      )


                                    ],
                                  ),
                                ],
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: <Widget>[
                                      new Text(
                                        'Address :',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        farmerdata.documents[i]
                                            .data['Address'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      )


                                    ],
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),

          );
        }

      }
    }else{
      return Loading();
    }



  }
}

import 'package:flutter/material.dart';
import 'package:kisan_app/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Payment.dart';
import 'directedfarmer.dart';
import 'directedlocalfarmer.dart';

class LocalBuyCropPage extends StatefulWidget {
  @override
  _LocalBuyCropPageState createState() => _LocalBuyCropPageState();
}
int a;
QuerySnapshot cropdata;
class _LocalBuyCropPageState extends State<LocalBuyCropPage> {
  crudMethods fobj = new crudMethods();
  String dummyurl='https://firebasestorage.googleapis.com/v0/b/saksham-kisan.appspot.com/o/noImageUploaded.png?alt=media&token=e70e4293-b204-4571-86fe-667c0ef0408c';
  FirebaseUser user;

  @override
  void initState() {
    fobj.getCropData().then((results) {
      setState(() {
        cropdata = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    user = fobj.getUser();

    if (cropdata != null) {
      return new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            centerTitle:true,
            title: Text('Crops', textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
            backgroundColor: Color(0xFF637BFF),
            elevation: 0,
          ),
          body:
          DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                colors: [Color(0xFF637BFF),Color(0XFF21C8F6)],
              ),
            ),
            child: new ListView.builder(

              itemCount: cropdata.documents.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildCropCard(context, index),
            ),
          )
      );
    }
    else {
      return Loading();
    }
  }
  Widget buildCropCard(BuildContext context, int i) {
    int q=int.parse(cropdata.documents[i].data['Quantity']);
    if(q<=100) {
      return new Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,

            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3.0, // soften the shadow
                spreadRadius: 3.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  0.0, // Move to bottom 10 Vertically
                ),
              ),
            ]
        ),


        child: Padding(

          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width:150,
                    height:150,
                    child: Image.network(
                      cropdata.documents[i].data['URL']==''?dummyurl:cropdata.documents[i].data['URL'],
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.grey)),
                    color: Colors.blue,
                    onPressed: () async{
                      if (await canLaunch(cropdata.documents[i].data['URL'])) {
                        await launch(cropdata.documents[i].data['URL']);
                      } else {
                        throw 'Could not launch URL';
                      }

                    },
                    child: Text("View Image"),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                child: Row(children: <Widget>[
                  Text(cropdata.documents[i].data['Type'],
                    style: new TextStyle(
                        fontSize: 26.0, fontWeight: FontWeight.bold),),
                  Spacer(),
                  SizedBox(width: 90,),
                  Text("Quantity (In Kg):  ",
                    style: new TextStyle(fontSize: 15.0),),
                  Text(cropdata.documents[i].data['Quantity'],
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),

                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                child: Row(children: <Widget>[
                  Text("Description :  ",
                    style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                  Text(cropdata.documents[i].data['Address'].toString(),
                      style: new TextStyle(
                        fontSize: 15.0, fontFamily: 'Montserrat',)),
                  Spacer(),

                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                child: Row(
                  children: <Widget>[
                    Text("View Date :  ",
                      style: new TextStyle(fontSize: 15.0),),
                    Text(cropdata.documents[i].data['View_date'],
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    SizedBox(width: 20,),
                    Text(
                      "Price Per Kg : ", style: new TextStyle(fontSize: 15.0),),
                    Text(cropdata.documents[i].data['Base_price'],
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Address : ", style: new TextStyle(fontSize: 15.0),),
                    Flexible(
                      child: Text(cropdata.documents[i].data['Address'],
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.grey)
                    ),
                    color: Colors.blue,
                    onPressed: () {

                      addCropDialog(context, i);
                    },
                    textColor: Colors.black,
                    child: Text("Buy Now"),)
              ),


            ],
          ),

        ),

      );
    }else{
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
  }

  Future<bool> addCropDialog(BuildContext context, int i) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {

          return AlertDialog(

            title: Center(child: Text("Crop Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),

            actions: <Widget>[
              FlatButton(
                child: Text('Buy now'),
                textColor: Colors.blue,
                onPressed: () {
                    a=i;
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Payment("yes",fobj.user.email,cropdata.documents[i].data['Email'],cropdata.documents[i].data['Type'])));
                },
              ),
              FlatButton(
                child: Text('Farmer Profile'),
                textColor: Colors.blue,
                onPressed: () {
                  a=i;
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DirectedFarmerProfile(cropdata.documents[i].data['Email'])));
                },
              ),
              FlatButton(
                child: Text('Back'),
                textColor: Colors.blue,
                onPressed: () {
                  fobj.getCropData().then((results) {
                    setState(() {
                      cropdata = results;
                    });
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],


            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                new Text(
                                  'Type : ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  cropdata.documents[i]
                                      .data['Type'],
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
                            left: 10.0, right: 10.0, top: 10.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                new Text(
                                  'Quantity : ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  cropdata.documents[i]
                                      .data['Quantity'],
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
                            left: 10.0, right: 10.0, top: 10.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                new Text(
                                  'Base Price : ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  cropdata.documents[i]
                                      .data['Base_price'],
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
                            left: 10.0, right: 10.0, top: 10.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                new Text(
                                  'Phone Number:',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                new Text(
                                  cropdata.documents[i]
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

                  ],
                ),
              ),
            ),

          );

        }
    );
  }


}
class emailvalafunction{
  getEmail(){

    return cropdata.documents[a].data['Email'];
  }
  getNumber(){
    return a;
  }
}
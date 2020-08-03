import 'package:flutter/material.dart';
import 'package:kisan_app/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_app/Constants/loading.dart';
class ShowService extends StatefulWidget {
  @override
  _ShowServiceState createState() => _ShowServiceState();
}

class _ShowServiceState extends State<ShowService> {
  crudMethods fobj = new crudMethods();
  QuerySnapshot servicedata1;
FirebaseUser user;
String a;
  @override
  void initState() {
    fobj.getAddedServiceData().then((results) {
      setState(() {
        servicedata1 = results;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    if (servicedata1 != null) {
      user=fobj.getUser();
      return new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            elevation: 0,
            centerTitle:true,
            title: Text(' My Services', textAlign: TextAlign.center,),
            backgroundColor: Color(0xFF637BFF),
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
              itemCount: servicedata1.documents.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildServiceCard(context, index),
            ),
          )
      );
    }
    else {
      return Loading();
    }
  }

  Widget buildServiceCard(BuildContext context, int i) {
    a = user.email;
    if (a == servicedata1.documents[i].data['Email']) {
      return new Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
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
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(servicedata1.documents[i].data['Type'],
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    "Service Type: ", style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                  Text("${servicedata1.documents[i].data['Service_type']}.",
                    style: new TextStyle(
                      fontSize: 17.0, fontFamily: 'Montserrat',),),
                  Spacer(),

                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Price Per Unit : ", style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                    Text("${servicedata1.documents[i].data['Charges']} ₹",
                        style: new TextStyle(
                          fontSize: 17.0, fontFamily: 'Montserrat',)
                    ),
                    Spacer()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    "Phone number: ", style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                  Text(servicedata1.documents[i].data['Phone'],
                      style: new TextStyle(
                        fontSize: 17.0, fontFamily: 'Montserrat',)
                  ),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 5.0,left: 10.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.grey)
                      ),
                      color: Colors.green,
                      onPressed: () {
                    }, child: Text("Edit",style: TextStyle(fontSize: 17.0, fontFamily: 'Montserrat',color: Colors.white),),),
                    Spacer(),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.grey)
                      ),
                      color: Colors.blue,
                      onPressed: () {
                    }, child: Text("Chat",style: TextStyle(fontSize: 17.0, fontFamily: 'Montserrat',color: Colors.white),),)
                  ],
                ),
              ),
            ],
          ),

        ),
      );
    }
    else {
      return Container(
        width: 0.0,
        height: 0.0,

      );
    }
  }
}


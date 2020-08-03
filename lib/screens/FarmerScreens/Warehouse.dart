import 'package:flutter/material.dart';
import 'package:kisan_app/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/screens/BuyerScreen/Payment.dart';
import 'package:kisan_app/screens/FarmerScreens/servicesprofile.dart';

import '../../app_localizations.dart';
import '../chat.dart';
import '../chat_screen.dart';
class WareHouse extends StatefulWidget {
  @override
  _WareHouseState createState() => _WareHouseState();
}

class _WareHouseState extends State<WareHouse> {
  crudMethods fobj = new crudMethods();
  QuerySnapshot servicedata1,servicedata;
  FirebaseUser user;
  String a;
  String user1;
  String service;
  @override
  void initState() {
    fobj.getAddedServiceData().then((results) {
      setState(() {
        servicedata1 = results;
      });
    });
    fobj.getServiceData().then((results) {
      setState(() {
        servicedata = results;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    if (servicedata1 != null && servicedata!=null) {
      user=fobj.getUser();
      return new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            centerTitle:true,
            title: Text((AppLocalizations.of(context).translate('13')), textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
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
              itemCount: servicedata1.documents.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildTransportationCard(context, index),
            ),
          )
      );
    }
    else {
      return Loading();
    }

  }
  Widget buildTransportationCard(BuildContext context, int i) {
    a = user.email;
    String name='';
    for(int k=0;k<servicedata.documents.length;k++){
      if(servicedata.documents[k].documentID==servicedata1.documents[i].data['Email']){
        name=servicedata.documents[k].data['Name'];
        break;
      }
    }
    if ("coldstorage/warehouse" == servicedata1.documents[i].data['Type']) {
      user1=servicedata1.documents[i].data['Email'];
      service=servicedata1.documents[i].data['Service_type'];
      return new Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
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
                  Flexible(
                    child: Text(servicedata1.documents[i].data['Type'].toString().toUpperCase(),
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                  ),

                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    (AppLocalizations.of(context).translate('25')), style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                  Flexible(
                    child: Text("${servicedata1.documents[i].data['Service_type']}.",
                      style: new TextStyle(
                        fontSize: 17.0, fontFamily: 'Montserrat',),),
                  ),


                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      (AppLocalizations.of(context).translate('26')), style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                    Flexible(
                      child: Text("${servicedata1.documents[i].data['Charges']} ₹",
                          style: new TextStyle(
                            fontSize: 17.0, fontFamily: 'Montserrat',)
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    (AppLocalizations.of(context).translate('27')), style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                  Flexible(
                    child: Text("${name}.",
                      style: new TextStyle(
                        fontSize: 17.0, fontFamily: 'Montserrat',),),
                  ),

                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    (AppLocalizations.of(context).translate('28')), style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                  Flexible(
                    child: Text(servicedata1.documents[i].data['Phone'],
                        style: new TextStyle(
                          fontSize: 17.0, fontFamily: 'Montserrat',)
                    ),
                  ),
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
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(
                            "yes",fobj.user.email,servicedata1.documents[i].data['Email'],servicedata1.documents[i].data['Type']
                        )));
                      },
                      child: Text((AppLocalizations.of(context).translate('84')),style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0),),
                    ),
                    SizedBox(width: 5,),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.grey)
                      ),
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceProfile(servicedata1.documents[i].data['Email'])));
                      },
                      child: Text((AppLocalizations.of(context).translate('85')),style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0),),
                    ),
                    SizedBox(width: 5,),
                    RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.grey)
              ),
                    color: Colors.blue,
                    onPressed: () {
                      fobj.addchat({
                        'sender':fobj.user.email,
                        'reciever':servicedata1.documents[i].data['Email'],
                        'text':"",
                        'isseen':true
                      }).then((result) {
                      }).catchError((e) {
                        print(e);
                      });
                      fobj.addchatuser({
                        'reciever email':servicedata1.documents[i].data['Email'],
                      },servicedata1.documents[i].data['Email']).then((result) {
                      }).catchError((e) {
                        print(e);
                      });
                      fobj.addchatuser1({
                        'reciever email':fobj.user.email,
                      },servicedata1.documents[i].data['Email']).then((result) {
                      }).catchError((e) {
                        print(e);
                      });

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>ChatScreen()));
                    }, child: Text((AppLocalizations.of(context).translate('29')),style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0),),)

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

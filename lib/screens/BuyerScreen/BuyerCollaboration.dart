import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/screens/BuyerScreen/directedfarmer.dart';
import 'package:kisan_app/screens/FarmerScreens/SelfCollaboration.dart';

import '../../app_localizations.dart';
import '../../crud.dart';

class BuyerCollaboration extends StatefulWidget {
  @override
  _BuyerCollaborationState createState() => _BuyerCollaborationState();
}

class _BuyerCollaborationState extends State<BuyerCollaboration> {

  crudMethods fobj = new crudMethods();
  QuerySnapshot collabdata;
  @override
  void initState() {
    fobj.getcollaboration().then((results) {
      setState(() {
        collabdata = results;
      });
    });
  }
  int count=0;
  @override
  Widget build(BuildContext context) {
    if(collabdata!=null) {
      for(int i=0;i<collabdata.documents.length;i++) {
        if (fobj.user.email == collabdata.documents[i].data['Buyeremail']){
          count++;
        }}
      if(count!=0) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            centerTitle:true,
            title: Text('Collaboration', textAlign: TextAlign.center,),
            backgroundColor: Colors.indigoAccent[100],
            elevation: 0,
          ),
        body: Column(
          children: <Widget>[
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

                ),
            Container(
              child: buildCollabCard(),
            )
          ],
        ),

      );
      }else{
        return Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              centerTitle:true,
              title: Text('Collaboration', textAlign: TextAlign.center,),
              backgroundColor: Colors.indigoAccent[100],
              elevation: 0,
            ),
          body:DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.0, 0.0),
                colors: [Colors.indigoAccent[100], Colors.white],
              ),
            ),
            child:Center(
              child: Text("No Requests For Collaboration",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          )



        );
      }
    }
    else {
      return Loading();
    }

  }
  Widget buildCollabCard() {
    int i;
    for(i=0;i<collabdata.documents.length;i++) {
      if (fobj.user.email == collabdata.documents[i].data['Buyeremail']) {
        if(collabdata.documents[i].data['Response']=='1') {
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
                      Text("From : ${collabdata.documents[i].data['Farmeremail']}",
                        style: new TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                      Spacer(),
                    ]),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.grey)
                    ),
                    color: Colors.blue,
                    child: Text("Profile"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>DirectedFarmerProfile(collabdata.documents[i].data['Farmeremail'])));
                    },
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 20,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              side: BorderSide(color: Colors.grey)
                          ),
                          color: Colors.blue,
                          child: Text("Accept request"),
                          onPressed: (){
                            fobj.addcollaborationrequest1({
                              'Buyeremail':fobj.user.email,
                              'Farmeremail':collabdata.documents[i].data['Farmeremail'],
                              'Status':'Accepted',
                              'Response':'0'
                            },collabdata.documents[i].documentID).then((result) {
                              fobj.getcollaboration().then((results) {
                                setState(() {
                                  collabdata = results;
                                });
                              });
                            }).catchError((e) {
                              print(e);
                            });
                          },
                        ),
                        SizedBox(width: 20,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              side: BorderSide(color: Colors.grey)
                          ),
                          color: Colors.blue,
                          child: Text("Decline request"),
                          onPressed: (){
                            fobj.addcollaborationrequest1({
                              'Buyeremail':fobj.user.email,
                              'Farmeremail':collabdata.documents[i].data['Farmeremail'],
                              'Status':'Declined',
                              'Response':'0'
                            },collabdata.documents[i].documentID).then((result) {
                              fobj.getcollaboration().then((results) {
                                setState(() {
                                  collabdata = results;
                                });
                              });
                            }).catchError((e) {
                              print(e);
                            });
                          },
                        )
                      ],
                    ),
                  ),



                ],
              ),

            ),
          );
        }else{
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
                      Text("From : ${collabdata.documents[i].data['Farmeremail']}",
                        style: new TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                      Spacer(),
                    ]),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.grey)
                    ),
                    color: Colors.blue,
                    child: Text("Profile"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>DirectedFarmerProfile(collabdata.documents[i].data['Farmeremail'])));
                    },
                  ),
                ],
              ),

            ),
          );
        }
      }
      else {
        return Container(
          width: 0.0,
          height: 0.0,

        );
      }
    }
  }
}



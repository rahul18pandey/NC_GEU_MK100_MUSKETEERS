import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/screens/FarmerScreens/SelfCollaboration.dart';

import '../../app_localizations.dart';
import '../../crud.dart';
import 'buyerprofilefarmerside.dart';
class Collaboration extends StatefulWidget {
  @override
  _CollaborationState createState() => _CollaborationState();
}

class _CollaborationState extends State<Collaboration> {

  crudMethods fobj = new crudMethods();
  QuerySnapshot collabdata,buyersdata;
  @override
  void initState() {
    fobj.getcollaboration().then((results) {
      setState(() {
       collabdata = results;
      });
    });
    fobj.getData().then((results) {
      setState(() {
        buyersdata = results;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if(collabdata!=null && buyersdata!= null) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle:true,
          title: Text("Collaboration", textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
          backgroundColor: Color(0xFF637BFF),
          elevation: 0,
          automaticallyImplyLeading: true,
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
            SizedBox(height: 20,),
            Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.grey)
                ),color: Colors.blue,
                child: Text("Self collaboration"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>SelfCollaboration()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text("Requests For Collaboration",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Container(
              child: buildCollabCard(),
            )
          ],
        ),
      );
    }
    else {
      return Loading();
    }

  }
  Widget buildCollabCard() {
    int i;
    String name='';
  for(i=0;i<collabdata.documents.length;i++) {
    if (fobj.user.email == collabdata.documents[i].data['Farmeremail']) {
      for(int l=0;l<buyersdata.documents.length;l++){
        if(buyersdata.documents[l].documentID==collabdata.documents[i].data['Buyeremail']){
          name=buyersdata.documents[l].data['Name'];
          break;
        }
      }
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
                  Text("From : ${name}",
                    style: new TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                  Spacer(),
                ]),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.grey)
                ),color: Colors.blue,
                child: Text("Profile"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>BidderProfile(user:collabdata.documents[i].data['Buyeremail'])));
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
                      ),color: Colors.blue,
                      child: Text("Accept request"),
                      onPressed: (){
                        fobj.addcollaborationrequest1({
                          'Buyeremail':collabdata.documents[i].data['Buyeremail'],
                          'Farmeremail':fobj.user.email,
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
                      ),color: Colors.blue,
                      child: Text("Decline request"),
                      onPressed: (){
                        fobj.addcollaborationrequest1({
                          'Buyeremail':collabdata.documents[i].data['Buyeremail'],
                          'Farmeremail':fobj.user.email,
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
                    Text("From : ${name}",
                      style: new TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                    Spacer(),
                  ]),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.grey)
                  ),color: Colors.blue,
                  child: Text("Profile"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>BidderProfile(user:collabdata.documents[i].data['Buyeremail'])));
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



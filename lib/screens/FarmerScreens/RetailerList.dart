import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/screens/FarmerScreens/buyerprofilefarmerside.dart';

import '../../app_localizations.dart';
import '../../crud.dart';
import '../chat_screen.dart';
class RetailerList extends StatefulWidget {
  @override
  _RetailerListState createState() => _RetailerListState();
}

class _RetailerListState extends State<RetailerList> {
  double width,height;
  crudMethods fobj = new crudMethods();
  QuerySnapshot buyerdata;
  @override
  void initState() {
    fobj.getData().then((results) {
      setState(() {
        buyerdata = results;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle:true,
        title: Text("Collaboration", textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
        backgroundColor: Color(0xFF637BFF),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: DecoratedBox(
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
          itemCount: buyerdata.documents.length,
          itemBuilder: (BuildContext context, int index) =>
              buildRetailerCard(context, index),
        ),
      ),
    );
  }

  Widget buildRetailerCard(BuildContext context, int i) {
    String name='';
    print(buyerdata.documents[i].data['Type']=='local');
    if (buyerdata.documents[i].data['Type']=='local') {
      return new Container(
        margin: EdgeInsets.all(15),
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
                  Text(
                    "Name :", style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),),
                  Flexible(
                    child: Text(buyerdata.documents[i].data['Name'],
                        style: new TextStyle(
                          fontSize: 17.0, fontFamily: 'Montserrat',)
                    ),
                  ),

                ]),
              ),
                    Row(
                      children: <Widget>[
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              side: BorderSide(color: Colors.grey)
                          ),
                          color: Colors.blue,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BidderProfile(user:buyerdata.documents[i].data['Email'])));
                          },
                          child: Text((AppLocalizations.of(context).translate('85')),style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0),),
                        ),
                        SizedBox(width: 10,),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12.0),
                            side: BorderSide(color: Colors.grey),
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            fobj.addchat({
                              'sender':fobj.user.email,
                              'reciever':buyerdata.documents[i].data['Email'],
                              'text':"",
                              'isseen':true
                            }).then((result) {
                            }).catchError((e) {
                              print(e);
                            });
                            fobj.addchatuser({
                              'reciever email':buyerdata.documents[i].data['Email'],
                            },buyerdata.documents[i].data['Email']).then((result) {
                            }).catchError((e) {
                              print(e);
                            });
                            fobj.addchatuser1({
                              'reciever email':fobj.user.email,
                            },buyerdata.documents[i].data['Email']).then((result) {
                            }).catchError((e) {
                              print(e);
                            });

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>ChatScreen()));
                          }, child: Text((AppLocalizations.of(context).translate('29')),style: TextStyle(fontSize: 17.0, fontFamily: 'Montserrat',color: Colors.white)),)

                      ],
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


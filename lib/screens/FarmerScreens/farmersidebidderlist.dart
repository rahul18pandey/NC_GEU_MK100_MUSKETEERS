import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisan_app/screens/FarmerScreens/showcrop.dart';
import '../../app_localizations.dart';
import 'buyerprofilefarmerside.dart';
import 'package:kisan_app/constants.dart';

class FarmerSideBidderList extends StatefulWidget {
  @override
  _FarmerSideBidderListState createState() => _FarmerSideBidderListState();
}

class _FarmerSideBidderListState extends State<FarmerSideBidderList> {

  crudMethods fobj = new crudMethods();
  cropnumber c=new cropnumber();
  QuerySnapshot cropdata3;
  QuerySnapshot biddingdata3;
  QuerySnapshot buyerdata;
  FirebaseUser user;
  String farmeremail;
  int n;
  @override
  void initState() {
    fobj.getbiddingdata().then((results) {
      setState(() {
        biddingdata3 = results;
      });
    });
    fobj.getCropData().then((results) {
      setState(() {
        cropdata3 = results;
      });
    });
    fobj.getData().then((results){
      setState(() {
       buyerdata=results;
      });
    });
  }
  int count=0;
  @override
  Widget build(BuildContext context) {
    if (biddingdata3 != null && cropdata3!=null && buyerdata!=null) {
      for(int i=0;i<biddingdata3.documents.length;i++){
        if(fobj.user.email==biddingdata3.documents[i].data['Farmer_email'] && biddingdata3.documents[i].data['Crop_type']==cropdata3.documents[number].data['Type']) {
          for(int j=0;j<buyerdata.documents.length;j++) {
            if(buyerdata.documents[j].documentID==biddingdata3.documents[i].data['Buyer_email']) {

              count++;
              break;

            }}}
      }
      number=c.getnumber();
      user=fobj.getUser();
      farmeremail=user.email;
      if(count!=0) {
        return new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text((AppLocalizations.of(context).translate('53')), textAlign: TextAlign.center,),
            backgroundColor: Color(0xFF637BFF),
            automaticallyImplyLeading: true,
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

              itemCount: biddingdata3.documents.length,
              itemBuilder: (BuildContext context, int index) =>
                  buildbiddercard(context, index),
            ),
          )
      );
      }else{
        return new Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text((AppLocalizations.of(context).translate('53')), textAlign: TextAlign.center,),
              backgroundColor: Color(0xFF637BFF),
              automaticallyImplyLeading: true,
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
              child: Center(
                child: Text((AppLocalizations.of(context).translate('83')),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              )
            )
        );
      }
    }
    else {
      return Loading();
    }
  }
  Widget buildbiddercard(BuildContext context, int i){
    if(farmeremail==biddingdata3.documents[i].data['Farmer_email'] && biddingdata3.documents[i].data['Crop_type']==cropdata3.documents[number].data['Type']) {
      for(int j=0;j<buyerdata.documents.length;j++) {
        if(buyerdata.documents[j].documentID==biddingdata3.documents[i].data['Buyer_email']) {
          return new Container(
        child: FlatButton(
          child: Card(
            shape: RoundedRectangleBorder(side: BorderSide.none, ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                    child: Row(children: <Widget>[
                      Text(buyerdata.documents[j].data['Name'],
                        style: new TextStyle(
                          fontSize: 20.0,),),
                      Spacer(),

                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                    child: Row(children: <Widget>[
                      Text((AppLocalizations.of(context).translate('28'))+" : "),
                      Text(buyerdata.documents[j].data['Phone'].toString(),
                        style: new TextStyle(
                            fontSize: 20.0,fontWeight: FontWeight.bold),),
                      Spacer(),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                    child: Row(children: <Widget>[
                      Text((AppLocalizations.of(context).translate('54'))+" : "),
                      Text(biddingdata3.documents[i].data['Current_bid'].toString(),
                        style: new TextStyle(
                            fontSize: 20.0,fontWeight: FontWeight.bold),),
                      Spacer(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>BidderProfile(user:buyerdata.documents[j].documentID)));
          },
        ),

      );
        }
      }
    }
    else{
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
  }


}

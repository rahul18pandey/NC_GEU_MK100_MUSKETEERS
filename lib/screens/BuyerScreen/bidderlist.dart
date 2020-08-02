import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'buycropPage.dart';
import 'package:kisan_app/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisan_app/constants.dart';

class BidderList extends StatefulWidget {
  @override
  _BidderListState createState() => _BidderListState();
}

class _BidderListState extends State<BidderList> {
  crudMethods fobj = new crudMethods();
  emailvalafunction e=new emailvalafunction();
  int number;
  String farmeremail;
  QuerySnapshot biddingdata;
  QuerySnapshot cropdata2,buyerdata;

  @override
  void initState() {
    fobj.getbiddingdata().then((results) {
      setState(() {
        biddingdata = results;
      });
    });
    fobj.getData().then((results) {
      setState(() {
        buyerdata = results;
      });
    });
    fobj.getCropData().then((results) {
      setState(() {
        cropdata2 = results;
      });
    });
  }
 String name='';
  @override
  Widget build(BuildContext context) {
    if (biddingdata != null && cropdata2!=null &&buyerdata!=null) {
        number=e.getNumber();
        farmeremail=e.getEmail();
      return new Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Center(child: Text('Current Bidders', textAlign: TextAlign.center,)),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blue,
          ),
          body:
          new ListView.builder(

            itemCount: biddingdata.documents.length,
            itemBuilder: (BuildContext context, int index) =>
                buildbiddercard(context, index),
          ),
      );
    }
    else {
      return Loading();
    }
  }
  Widget buildbiddercard(BuildContext context, int i){
    if(farmeremail==biddingdata.documents[i].data['Farmer_email'] && biddingdata.documents[i].data['Crop_type']==cropdata2.documents[number].data['Type']) {
      for(int p=0;p<buyerdata.documents.length;p++){
        if(biddingdata.documents[i].data['Buyer_email']==buyerdata.documents[p].documentID){
          name=buyerdata.documents[p].data['Name'];
          break;
        }
      }
      if(biddingdata.documents[i].data['Buyer_email']==fobj.user.email) {
        return new Container(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                child: Row(children: <Widget>[
                  Text("Name : ${name}",
                    style: new TextStyle(
                        fontSize: 20.0,),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                child: Row(children: <Widget>[
                  Text("Bid Placed : ${biddingdata.documents[i].data['Current_bid']}",
                    style: new TextStyle(
                        fontSize: 20.0,fontWeight: FontWeight.bold),),
                  Spacer(),
                ]),
              ),
            ],
          ),
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
    else{
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
  }
}


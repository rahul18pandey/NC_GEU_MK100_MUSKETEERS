import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisan_app/crud.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app_localizations.dart';
import 'farmersidebidderlist.dart';

class ShowCrop extends StatefulWidget {
  @override
  _ShowCropState createState() => _ShowCropState();
}

int number;

class _ShowCropState extends State<ShowCrop> {
  crudMethods fobj = new crudMethods();
  QuerySnapshot cropdata;
  QuerySnapshot farmerdata;
  String a;
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
    a = user.email;
    if (cropdata != null) {
      return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            (AppLocalizations.of(context).translate('18')),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
          backgroundColor: Color(0xFF637BFF),
          elevation: 0,
        ),
        body: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              colors: [Color(0xFF637BFF), Color(0XFF21C8F6)],
            ),
          ),
          child: new ListView.builder(
            itemCount: cropdata.documents.length,
            itemBuilder: (BuildContext context, int index) =>
                buildCropCard(context, index),
          ),
        ),
      );
    } else {
      return Loading();
    }
  }

  Widget buildCropCard(BuildContext context, int i) {
    a = user.email;

    if (a == cropdata.documents[i].data['Email']) {
      print(cropdata.documents[i].data['URL']);
      int q=int.parse(cropdata.documents[i].data['Quantity']);
      if(q>100) {
        return new Container(
        margin: EdgeInsets.all(10),
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
            ]),
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
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    cropdata.documents[i].data['Type'],
                    style: new TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                  Spacer(),
                  Text(
                    '                   ' +
                        (AppLocalizations.of(context).translate('47')) +
                        ' : ',
                    style:
                        new TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'),
                  ),
                  Text(cropdata.documents[i].data['Base_price'],
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    (AppLocalizations.of(context).translate('46')) + ' : ',
                    style:
                        new TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'),
                  ),
                  Text(cropdata.documents[i].data['Auction_date'],
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                  Spacer(),
                  Text(
                    (AppLocalizations.of(context).translate('49')) + ' : ',
                    style:
                        new TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'),
                  ),
                  Text(cropdata.documents[i].data['Quantity'],
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text(
                    (AppLocalizations.of(context).translate('48')) + ' : ',
                    style:
                        new TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'),
                  ),
                  Text(cropdata.documents[i].data['View_date'],
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                  Spacer(),
                  Text(
                    '      ' +
                        (AppLocalizations.of(context).translate('50')) +
                        ' : ',
                    style:
                        new TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'),
                  ),
                  Text(cropdata.documents[i].data['Current_bid'].toString(),
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0)),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.grey)),
                      color: Colors.blue,
                      onPressed: () {
                        number = i;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FarmerSideBidderList()));
                      },
                      child: Text(
                          (AppLocalizations.of(context).translate('51')),
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0)),
                    ),

              ),
            ],
          ),
        ),
      );
      }else{
        return new Container(
          margin: EdgeInsets.all(10),
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
              ]),
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
                  padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text(
                      cropdata.documents[i].data['Type'],
                      style: new TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    Spacer(),
                    Text(
                      '                   ' +
                          (AppLocalizations.of(context).translate('47')) +
                          ' : ',
                      style:
                      new TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'),
                    ),
                    Text(cropdata.documents[i].data['Base_price'],
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                    Spacer(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text(
                      (AppLocalizations.of(context).translate('48')) + ' : ',
                      style:
                      new TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'),
                    ),
                    Text(cropdata.documents[i].data['View_date'],
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                    Spacer(),
                    Text(
                      (AppLocalizations.of(context).translate('49')) + ' : ',
                      style:
                      new TextStyle(fontSize: 15.0, fontFamily: 'Montserrat'),
                    ),
                    Text(cropdata.documents[i].data['Quantity'],
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                    Spacer(),
                  ]),
                ),

              ],
            ),
          ),
        );
      }
    } else {
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
  }
}

class cropnumber {
  getnumber() {
    return number;
  }
}

/* _showCrop(){
    String a=user.email;
    if (cropdata!= null){
      for(int i=0;i<cropdata.documents.length;i++)
        {
            if(a==cropdata.documents[i].data['Email'])
              {

                return ListView.separated(
                  itemCount: cropdata.documents.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(
                    color: Colors.deepOrange,
                  ),

                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cropdata.documents[i].data['Quantity']),
                    );
                  },
                );

              }
        }
    }
  }*/

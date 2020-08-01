import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/Constants/myheader.dart';
import 'package:kisan_app/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_app/crud.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../app_localizations.dart';
class BuyerProfilePage extends StatefulWidget {
  @override
  _BuyerProfilePageState createState() => _BuyerProfilePageState();
}

class _BuyerProfilePageState extends State<BuyerProfilePage> {
  crudMethods fobj = new crudMethods();
  QuerySnapshot buyerprofiledata,transactiondata;
  String a;
  FirebaseUser user;
  @override
  void initState() {
    fobj.getData().then((results) {
      setState(() {
        buyerprofiledata = results;
      });
    });
    fobj.gettransaction().then((results) {
      setState(() {
        transactiondata = results;
      });
    });
    super.initState();
  }
  double rating=0.0;
  @override
  Widget build(BuildContext context) {
    user = fobj.getUser();
    if(buyerprofiledata!=null&&transactiondata!=null) {
        int count=0;
        rating=0;
        for(int i=0;i<transactiondata.documents.length;i++){
          if(transactiondata.documents[i].data['Email']==fobj.user.email){
            if(transactiondata.documents[i].data['Buyer_Rating']!=""){
              count=count+1;
              rating=(rating+int.parse(transactiondata.documents[i].data['Buyer_Rating']));
            }
          }
        }
        if(rating!=0)
        rating=rating/count;


    }

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBody: true,
      body:_showProfile(),

    );

  }
_showProfile(){
  a=user.email;
  if (buyerprofiledata!= null) {
    for(int i=0;i<buyerprofiledata.documents.length;i++)
    {
      if(a==buyerprofiledata.documents[i].documentID)
      {
        if(buyerprofiledata.documents[i].data['Type']=="local") {
          return  SingleChildScrollView(
            child: Column(
              children: <Widget>[
                MyHeader(
                  height: 258,
                  imageUrl: 'assets/images/avatar_head.png',
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.arrow_back_ios),
                              Icon(Icons.menu,size: 36,)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'images/userimage.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  buyerprofiledata.documents[i]
                                      .data['Name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 4.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "User Information",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ...ListTile.divideTiles(
                            color: Colors.grey,
                            tiles: [
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.star, color: Colors.orange,),
                                title: Text("Rating"),
                                subtitle: Text( rating==0.0?"No one has rated yet" :"${rating}"),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.phone),
                                title: Text((AppLocalizations.of(context).translate('28'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['Phone']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.email),
                                title: Text((AppLocalizations.of(context).translate('34'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['Email']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.lock_outline),
                                title: Text((AppLocalizations.of(context).translate('35'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['Aadhar']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.map),
                                title: Text((AppLocalizations.of(context).translate('37'))),
                                subtitle: Text( buyerprofiledata.documents[i]
                                    .data['City'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('39'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['District'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text( (AppLocalizations.of(context).translate('40'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['State'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('41'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['Address'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('42'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['Pin'],),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        else if(buyerprofiledata.documents[i].data['Type']=="mandi") {
          return  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                MyHeader(
                  height: 258,
                  imageUrl: 'assets/images/avatar_head.png',
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.arrow_back_ios),
                              Icon(Icons.menu,size: 36,)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'images/userimage.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  buyerprofiledata.documents[i]
                                      .data['Name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 4.0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "User Information",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ...ListTile.divideTiles(
                            color: Colors.grey,
                            tiles: [
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.star, color: Colors.orange,),
                                title: Text("Rating"),
                                subtitle: Text( rating==0.0?"No one has rated yet" :"${rating}"),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.phone),
                                title: Text((AppLocalizations.of(context).translate('28'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['Phone']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.email),
                                title: Text((AppLocalizations.of(context).translate('34'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['Email']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.lock_outline),
                                title: Text('GST'),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['GST']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.home),
                                title: Text('License'),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['License']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.map),
                                title: Text((AppLocalizations.of(context).translate('37'))),
                                subtitle: Text( buyerprofiledata.documents[i]
                                    .data['City'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('39'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['District'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text( (AppLocalizations.of(context).translate('40'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['State'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('41'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['Address'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('42'))),
                                subtitle: Text(buyerprofiledata.documents[i]
                                    .data['Pin'],),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        else if("big"==buyerprofiledata.documents[i].data['Type'])
          {
            return  SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  MyHeader(
                    height: 258,
                    imageUrl: 'assets/images/avatar_head.png',
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        SafeArea(
                          bottom: false,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(Icons.arrow_back_ios),
                                Icon(Icons.menu,size: 36,)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                'images/userimage.png',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    buyerprofiledata.documents[i]
                                        .data['Name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 4.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "User Information",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ...ListTile.divideTiles(
                              color: Colors.grey,
                              tiles: [
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 1),
                                  leading: Icon(Icons.star, color: Colors.orange,),
                                  title: Text("Rating"),
                                  subtitle: Text( rating==0.0?"No one has rated yet" :"${rating}"),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 1),
                                  leading: Icon(Icons.phone),
                                  title: Text((AppLocalizations.of(context).translate('28'))),
                                  subtitle: Text(buyerprofiledata.documents[i]
                                      .data['Phone']),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 1),
                                  leading: Icon(Icons.email),
                                  title: Text((AppLocalizations.of(context).translate('34'))),
                                  subtitle: Text(buyerprofiledata.documents[i]
                                      .data['Email']),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 1),
                                  leading: Icon(Icons.lock_outline),
                                  title: Text('GST'),
                                  subtitle: Text(buyerprofiledata.documents[i]
                                      .data['GST']),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 1),
                                  leading: Icon(Icons.home),
                                  title: Text('License'),
                                  subtitle: Text(buyerprofiledata.documents[i]
                                      .data['License']),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 1),
                                  leading: Icon(Icons.my_location),
                                  title: Text((AppLocalizations.of(context).translate('41'))),
                                  subtitle: Text(buyerprofiledata.documents[i]
                                      .data['Address'],),
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 1),
                                  leading: Icon(Icons.my_location),
                                  title: Text((AppLocalizations.of(context).translate('42'))),
                                  subtitle: Text(buyerprofiledata.documents[i]
                                      .data['Pin'],),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );

          }
      }
    }
  }
  else {
    return Loading();
  }
}
}


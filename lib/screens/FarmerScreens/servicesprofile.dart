import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/Constants/myheader.dart';
import 'package:kisan_app/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kisan_app/crud.dart';
import '../../app_localizations.dart';
class ServiceProfile extends StatefulWidget {
  String useremail;
  ServiceProfile(this.useremail);
  @override
  _ServiceProfileState createState() => _ServiceProfileState();
}

class _ServiceProfileState extends State<ServiceProfile> {
  crudMethods fobj = new crudMethods();
  QuerySnapshot serviceprofiledata,transactiondata;
  String a;
  FirebaseUser user;
  double rating;
  @override
  void initState() {
    fobj.getServiceData().then((results) {
      setState(() {
        serviceprofiledata = results;
      });
    });
    fobj.gettransaction().then((results) {
      setState(() {
        transactiondata = results;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    user = fobj.getUser();
    if(serviceprofiledata!=null&&transactiondata!=null) {
      int count=0;
      rating=0.0;
      for(int i=0;i<transactiondata.documents.length;i++){
        if(transactiondata.documents[i].data['Email']==fobj.user.email){
          if(transactiondata.documents[i].data['Service_Rating']!=""){
            count=count+1;
            rating=(rating+int.parse(transactiondata.documents[i].data['Service_Rating']));
          }
        }
      }
      if(rating!=0)
        rating=rating/count;
      print(rating);
      return new Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBody: true,
      body:_showProfile(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.settings_voice),
        backgroundColor: Colors.indigoAccent,
      ),
    );
    }else{
      return Loading();
    }
  }
  _showProfile(){
    String a=user.email;
    if (serviceprofiledata!= null) {
      for(int i=0;i<serviceprofiledata.documents.length;i++)
      {
        if(widget.useremail==serviceprofiledata.documents[i].documentID)
        {
          return SingleChildScrollView(
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
                                  serviceprofiledata.documents[i]
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
                                title: Text((AppLocalizations.of(context).translate('86'))),
                                subtitle: Text(rating==0.0?"Noone has rated yet":"${rating}"),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.phone),
                                title: Text((AppLocalizations.of(context).translate('28'))),
                                subtitle: Text(serviceprofiledata.documents[i]
                                    .data['Phone']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.email),
                                title: Text((AppLocalizations.of(context).translate('34'))),
                                subtitle: Text(serviceprofiledata.documents[i]
                                    .data['Email']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.lock_outline),
                                title: Text((AppLocalizations.of(context).translate('87'))),
                                subtitle: Text(serviceprofiledata.documents[i]
                                    .data['GST']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.home),
                                title: Text((AppLocalizations.of(context).translate('88'))),
                                subtitle: Text(serviceprofiledata.documents[i]
                                    .data['License']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.map),
                                title: Text((AppLocalizations.of(context).translate('37'))),
                                subtitle: Text(serviceprofiledata.documents[i]
                                    .data['City'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('39'))),
                                subtitle: Text(serviceprofiledata.documents[i]
                                    .data['District'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text( (AppLocalizations.of(context).translate('40'))),
                                subtitle: Text(serviceprofiledata.documents[i]
                                    .data['State'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('41'))),
                                subtitle: Text(serviceprofiledata.documents[i]
                                    .data['Address'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('42'))),
                                subtitle: Text(serviceprofiledata.documents[i]
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
    else {
      return Text('Loading, Please wait..');
    }
  }
}


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/Constants/myheader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kisan_app/crud.dart';
import '../../app_localizations.dart';
import 'buycropPage.dart';
import '../chat_screen.dart';

class DirectedFarmerProfile extends StatefulWidget {
  final String email1;
  DirectedFarmerProfile(this.email1);
  @override
  _DirectedFarmerProfileState createState() => _DirectedFarmerProfileState();
}

class _DirectedFarmerProfileState extends State<DirectedFarmerProfile> {
  crudMethods fobj = new crudMethods();
emailvalafunction e=new emailvalafunction();
String a;

  QuerySnapshot farmerdata,transactiondata;

  @override
  void initState() {
    fobj.getFarmerData().then((results) {
      setState(() {
        farmerdata = results;
      });
    });
    fobj.gettransaction().then((results) {
      setState(() {
        transactiondata = results;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBody: true,
      body:_showFarmerProfile(),
    );
  }
  _showFarmerProfile(){
   double rating;

    if (farmerdata!= null&&transactiondata!=null) {
      int count=0;
      rating=0.0;
      for(int i=0;i<transactiondata.documents.length;i++){
        if(transactiondata.documents[i].data['Farmer_email']==widget.email1){
          if(transactiondata.documents[i].data['Farmer_Rating']!=""){
            count=count+1;
            rating=(rating+int.parse(transactiondata.documents[i].data['Farmer_Rating']));
          }
        }
      }
      if(rating!=0)
      rating=rating/count;
      for(int i=0;i<farmerdata.documents.length;i++)
      {
        if(widget.email1==farmerdata.documents[i].documentID)
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
                                  farmerdata.documents[i]
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "User Information",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12.0),
                            side: BorderSide(color: Colors.grey)
                        ),
                        color: Colors.blue,
                        child: new Text("Chat",style: TextStyle(fontSize: 17.0, fontFamily: 'Montserrat',color: Colors.white)),
                        onPressed: () {
                          fobj.addchat({
                            'sender':fobj.user.email,
                            'reciever':widget.email1,
                            'text':"",
                            'isseen':true
                          }).then((result) {
                          }).catchError((e) {
                            print(e);
                          });
                          fobj.addchatuser({
                            'reciever email':widget.email1,
                          },widget.email1).then((result) {
                          }).catchError((e) {
                            print(e);
                          });
                          fobj.addchatuser1({
                            'reciever email':fobj.user.email,
                          },widget.email1).then((result) {
                          }).catchError((e) {
                            print(e);
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>ChatScreen()));
                        },
                      ),
                    ],
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
                                subtitle: Text(farmerdata.documents[i]
                                    .data['Phone']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.email),
                                title: Text((AppLocalizations.of(context).translate('34'))),
                                subtitle: Text(farmerdata.documents[i]
                                    .data['Email']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.lock_outline),
                                title: Text((AppLocalizations.of(context).translate('35'))),
                                subtitle: Text(farmerdata.documents[i]
                                    .data['Aadhar']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.home),
                                title: Text((AppLocalizations.of(context).translate('36'))),
                                subtitle: Text(farmerdata.documents[i]
                                    .data['House']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.map),
                                title: Text((AppLocalizations.of(context).translate('37'))),
                                subtitle: Text( farmerdata.documents[i]
                                    .data['City'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('39'))),
                                subtitle: Text(farmerdata.documents[i]
                                    .data['District'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text( (AppLocalizations.of(context).translate('40'))),
                                subtitle: Text(farmerdata.documents[i]
                                    .data['State'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('41'))),
                                subtitle: Text(farmerdata.documents[i]
                                    .data['Address'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('42'))),
                                subtitle: Text(farmerdata.documents[i]
                                    .data['Pin_code'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('43'))),
                                subtitle: Text(farmerdata.documents[i]
                                    .data['Post'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('44'))),
                                subtitle: Text(farmerdata.documents[i]
                                    .data['Police'],),
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
    }else{
      return Loading();
    }



  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'dart:io';
import 'package:kisan_app/crud.dart';
import 'package:kisan_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'AddBill.dart';

class UploadBill extends StatefulWidget {
  @override
  _UploadBillState createState() => _UploadBillState();
}

class _UploadBillState extends State<UploadBill> {
  crudMethods fobj=new crudMethods();

  FirebaseUser user;
String filename;
  File _imageFile;
  QuerySnapshot billdata;




  @override
  void initState() {
    user=fobj.getUser();
    fobj.getBill().then((results) {
      setState(() {
        billdata = results;
      });
    });
  }
 int count=0;
  @override
  Widget build(BuildContext context) {

    if(billdata!=null) {
      for(int i=0;i<billdata.documents.length;i++){
        if (billdata.documents[i].data['Email'] == user.email){
          count++;
          break;

        }
      }
      if(count!=0) {
        return Scaffold(
      appBar: AppBar(title: new Text("Your Bills"),elevation: 0,
          backgroundColor: Colors.indigoAccent[100],
        actions: <Widget>[

          FlatButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>AddBill()));
          } , child: new Text("Add Bill",style: new TextStyle(fontSize: 20.0,color: Colors.white),)
          ),

        ],
        automaticallyImplyLeading: false,
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
        child: new ListView.builder(
          itemCount: billdata.documents.length,
          itemBuilder: (BuildContext context, int index) =>
              showbill(context, index),
        ),
      ),
    );
      }else{
        return Scaffold(
          appBar: AppBar(title: new Text("Your Bills"),elevation: 0,
            backgroundColor: Colors.indigoAccent[100],
            actions: <Widget>[

              FlatButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>AddBill()));
                fobj.getBill().then((results) {
                  setState(() {
                    billdata = results;
                  });
                });
              } , child: new Text("Add Bill",style: new TextStyle(fontSize: 20.0,color: Colors.white),)
              ),

            ],
            automaticallyImplyLeading: false,
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
            child: Center(child:Text("You have not uploaded any bills yet"))
          ),
        );
      }
    }else{
      return Loading();
    }
  }

   showbill(BuildContext context,int i) {

       if (billdata.documents[i].data['Email'] == user.email) {
         return Container(
             child: Column(
                 children: <Widget>[
                   Container(
                     child: Text("Bill For Crop :  ${billdata.documents[i].data['Type']}",
                       style: TextStyle(
                           fontWeight: FontWeight.w500, fontSize: 20),),
                   ),
                   SizedBox(height: 5,),
                   Container(
                     margin: EdgeInsets.all(20),
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(20),
                           topRight: Radius.circular(20),
                           bottomRight: Radius.circular(20),
                           bottomLeft: Radius.circular(20)),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black26,
                           blurRadius: 5.0, // soften the shadow
                           spreadRadius: 5.0, //extend the shadow
                           offset: Offset(
                             0.0, // Move to right 10  horizontally
                             0.0, // Move to bottom 10 Vertically
                           ),
                         )
                       ],
                     ),
                     child:
                     Container(
                         child: Image.network(
                             billdata.documents[i].data['URL'])),
                   ),
                 ]
             )


         );
       } else {
         return Container(
           width: 0.0,
           height: 0.0,
         );
       }
        }

}


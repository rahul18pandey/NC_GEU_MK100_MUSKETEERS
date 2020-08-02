import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/screens/chat.dart';

import '../crud.dart';
import 'BuyerScreen/LcoalBuyerHome.dart';
import 'BuyerScreen/bigbuyerhome.dart';
import 'BuyerScreen/mandibuyerhome.dart';
import 'FarmerScreens/HomePage.dart';
import 'ServiceScreen/ServiceHome.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  crudMethods fobj=new crudMethods();
  QuerySnapshot chatuserdata,chatdata,farmerdata,buyerdata,servicedata;
  String companyname;

  @override
  void initState() {
    fobj.getchatuser().then((results) {
      setState(() {
        chatuserdata = results;
      });
    });
    fobj.getchat().then((results){
      setState((){
        chatdata=results;
      });
    });
    fobj.getData().then((results) {
      setState(() {
        buyerdata = results;
      });
    });
    fobj.getFarmerData().then((results) {
      setState(() {
        farmerdata = results;
      });
    });
    fobj.getServiceData().then((results) {
      setState(() {
        servicedata = results;
      });
    });

    super.initState();
  }
  String str;
  @override
  Widget build(BuildContext context) {
    if(chatuserdata!=null && chatdata!=null&&buyerdata!=null&&farmerdata!=null&&servicedata!=null) {
      for(int i=0;i<buyerdata.documents.length;i++)
      {

        if(fobj.user.email==buyerdata.documents[i].documentID)
        {

          if("local"==buyerdata.documents[i].data['Type'])
          {
                 str='local';
                      break;
          }
          else if("mandi"==buyerdata.documents[i].data['Type'])
          {
  str='mandi';
  break;

          }
          else if("big"==buyerdata.documents[i].data['Type'])
          {
             str='big';
               break;

          }
        }
      }
      for(int j=0;j<farmerdata.documents.length;j++)
      {

        if(fobj.user.email==farmerdata.documents[j].documentID)
        {
              str='farmer';

          break;
        }
      }
      for(int j=0;j<servicedata.documents.length;j++)
      {

        if(fobj.user.email==servicedata.documents[j].documentID)
        {


        str='service';
          break;
        }

      }
      return new WillPopScope(
          onWillPop: () {
           if(str=='local'){
              return Navigator.push(context, MaterialPageRoute(builder: (context) => BuyerHomeScreen()));
           }else if(str=='mandi'){
             return Navigator.push(context, MaterialPageRoute(builder: (context) => MandiBuyerHome()));
           }else if(str=='big'){
             return Navigator.push(context, MaterialPageRoute(builder: (context) =>BigBuyerHome()));
           }else if(str=='farmer'){
             return Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
           }else if(str=='service'){
             return   Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceHomeScreen()));
           }else{
             Navigator.of(context).pop();
           }
          },
       child: Scaffold(
              appBar: new AppBar(
                automaticallyImplyLeading: false,
                title: Center(child: const Text("Saksham Kisan",style: TextStyle(fontFamily: 'BeVietnam'),)),
              ),
              body: ListView.builder(
                itemCount: chatuserdata.documents.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildchat(context, index),
              ),
       )
        );
    }else{
         return Scaffold(
          appBar: new AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: const Text("Saksham Kisan",style: TextStyle(fontFamily: 'BeVietnam'),)),
          ),
          body: Center(
            child: Loading(),
          ),
        );
    }
  }



  Widget buildchat(BuildContext context, int i) {
    int count=0;
    String name='';
    for(int k=0;k<chatdata.documents.length;k++)
    {
      if(chatdata.documents[k].data['reciever']==fobj.user.email&&chatuserdata.documents[i].data['reciever email']==chatdata.documents[k].data['sender']){
        if(!chatdata.documents[k].data['isseen']){
          count++;
        }
      }
    }
    for(int p=0;p<farmerdata.documents.length;p++){
      if(chatuserdata.documents[i].data['reciever email']==farmerdata.documents[p].documentID){
        name=farmerdata.documents[p].data['Name'];
        break;
      }
    }
    if(name==''){
      for(int p=0;p<buyerdata.documents.length;p++){
        if(chatuserdata.documents[i].data['reciever email']==buyerdata.documents[p].documentID){
          name=buyerdata.documents[p].data['Name'];
          break;
        }
      }
    }
    if(name==''){
      for(int p=0;p<servicedata.documents.length;p++){
        if(chatuserdata.documents[i].data['reciever email']==servicedata.documents[p].documentID){
          name=servicedata.documents[p].data['Name'];
          break;
        }
      }
    }
    return new Container(
      margin: EdgeInsets.all(5),

      child: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Chat("${chatuserdata.documents[i].data['reciever email']}")));
        },
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("${name}",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Container(
                      height:20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:count!=0?Colors.green:Colors.white),
                      child: Center(child: Text(count!=0?"${count}":'')))
                ],
              ),
            ),
            Divider(thickness: 2,height: 0,),
          ],

        ),
      ),
    );
  }
}

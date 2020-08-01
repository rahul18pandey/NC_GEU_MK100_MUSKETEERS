import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kisan_app/Constants/loading.dart';

import 'directedfarmer.dart';

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  crudMethods fobj = new crudMethods();
  QuerySnapshot transactiondata;
  QuerySnapshot buyerdata;
  FirebaseUser user;
  String rating;
  final TextEditingController _controller = new TextEditingController();
  var items = ['1', '2', '3', '4','5'];
  String a,token;
  QuerySnapshot collabdata;
  final Firestore _firestore = Firestore.instance;
  @override
  void initState() {
    fobj.gettransaction().then((results) {
      setState(() {
        transactiondata = results;
      });
    });
    fobj.getData().then((results) {
      setState(() {
        buyerdata = results;
      });
    });
    fobj.getcollaboration().then((results) {
      setState(() {
        collabdata = results;
      });
    });
    user=fobj.getUser();
  }
  int count=0;
  @override
  Widget build(BuildContext context) {
   if(transactiondata!=null && buyerdata!=null &&collabdata!=null){
       for(int i=0;i<transactiondata.documents.length;i++){
         if(transactiondata.documents[i].data['Email']==fobj.user.email){
           count++;
           break;
         }
       }
       if(count!=0) {
         return new Scaffold(
             resizeToAvoidBottomPadding: false,
             appBar: AppBar(
               centerTitle:true,
               title: Text('My Transaction', textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
               backgroundColor: Color(0xFF637BFF),
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
             itemCount: transactiondata.documents.length,
             itemBuilder: (BuildContext context, int index) =>
                 buildTransaction(context, index),
           ),
         )
     );
       }else{
         return new Scaffold(
             resizeToAvoidBottomPadding: false,
             appBar: AppBar(
               centerTitle:true,
               title: Text('My Transaction', textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
               backgroundColor: Color(0xFF637BFF),
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
               child:Center(
                 child: Text("You don't have any transaction",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               ),
             )
         );
       }
   }else {
     return Loading();
   }

  }
  Widget buildTransaction(BuildContext context, int i) {
    bool isrequest=false;
    int q;
     for( q=0;q<collabdata.documents.length;q++){
       if(collabdata.documents[q].data['Buyeremail']==fobj.user.email&&collabdata.documents[q].data['Farmeremail']==transactiondata.documents[i].data['Farmer_email']){

         isrequest=true;
         break;
       }
     }
      if(transactiondata.documents[i].data['Email']==user.email ) {
        if( !isrequest) {
          return new Container(
          margin: EdgeInsets.all(10.0),
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
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text(transactiondata.documents[i].data['Type'],
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),),
                    Spacer(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text("Bought From : ${transactiondata.documents[i].data['Farmer_email']}",
                      style: new TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),),
                    Spacer(),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                  child: Row(children: <Widget>[
                    Text("Quantity(kg) : ${transactiondata.documents[i].data['Quantity']}",
                      style: new TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),),
                    Spacer(),
                    RaisedButton(shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.grey)
                    ),
                        color: Colors.blue,onPressed: () {
                      if(transactiondata.documents[i].data['Farmer_Rating']=="")
                      {
                        dialogbox(context,i);
                      }else{
                        dialogbox(context,i);
                      }
                    }, child: Text("Rate Farmer",style: TextStyle(fontFamily:'Courier',fontWeight: FontWeight.bold,fontSize: 15.0)),),

                  ]),

                ),

                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.grey)
                    ),
                    color: Colors.blue,onPressed: () async {

                  QuerySnapshot tokendata = await _firestore.collection('User Token').getDocuments();
                  for(int k=0;k<tokendata.documents.length;k++)
                  {
                    if(transactiondata.documents[i].data['Farmer_email']==tokendata.documents[k].documentID)
                    {
                      token=tokendata.documents[k].data['token'];
                    }
                    print(token);
                  }
                  final postUrl = 'https://fcm.googleapis.com/fcm/send';
                  final data = {
                    "notification": {"body": "Message", "title": "You got a collaboration request from ${fobj.user.email}"},
                    "priority": "high",
                    "data": {
                      "click_action": "FLUTTER_NOTIFICATION_CLICK",
                      "id": "1",
                      "status": "done"
                    },
                    "to": "${token}"
                  };

                  final headers = {
                    'content-type': 'application/json',
                    'Authorization': 'key=AAAAUpvqyfU:APA91bEY5BnhVGzoGh9UWCuxpzbTZ030ey2aJ-vCJcpVodsfO9UNoumJPDRH6-tvU4tbwQFbBmoxpr9Iah4WluXEnaXuae6gBKRUbDJDj2pXzqgxm4NEHQt3usuqMU7_n7JaTOK8Asio'
                  };


                  BaseOptions options = new BaseOptions(
                    connectTimeout: 5000,
                    receiveTimeout: 3000,
                    headers: headers,
                  );


                  try {
                    final response = await Dio(options).post(postUrl,
                        data: data);

                    if (response.statusCode == 200) {
                      print("sending");
                    } else {
                      print('notification sending failed');
                      // on failure do sth
                    }
                  }
                  catch(e){
                    print('exception $e');
                  }

                  fobj.addcollaborationrequest({
                    'Buyeremail':fobj.user.email,
                    'Farmeremail':transactiondata.documents[i].data['Farmer_email'],
                    'Status':'Sent',
                    'Response':'1'
                  }).then((result) {
                    fobj.getcollaboration().then((results) {
                      setState(() {
                        collabdata = results;
                      });
                    });
                  }).catchError((e) {
                    print(e);
                  });


                }, child: Text("Send collaboration request",style: TextStyle(fontFamily:'Courier',fontWeight: FontWeight.bold,fontSize: 15.0)),),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.grey)
                  ),
                  color: Colors.blue,
                  child: Text('Farmer Profile'),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DirectedFarmerProfile(transactiondata.documents[i].data['Farmer_email'])));
                  },
                ),
              ],
            ),
          ),
        ),
      );
        }else{
          return new Container(
            margin: EdgeInsets.all(10.0),
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
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Text(transactiondata.documents[i].data['Type'],
                          style: new TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),),
                        Spacer(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Text("Bought From : ${transactiondata.documents[i].data['Farmer_email']}",
                          style: new TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),),
                        Spacer(),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Text("Quantity(kg) : ${transactiondata.documents[i].data['Quantity']}",
                          style: new TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),),

                        Spacer(),
                        RaisedButton(shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(28.0),
                            side: BorderSide(color: Colors.red)
                        ),onPressed: () {
                          if(transactiondata.documents[i].data['Farmer_Rating']=="")
                          {
                            dialogbox(context,i);
                          }else{
                            dialogbox(context,i);
                          }
                        }, child: Text("Rate Farmer",style: TextStyle(fontFamily:'Courier',fontWeight: FontWeight.bold,fontSize: 15.0)),),

                      ]),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                      child: Row(children: <Widget>[
                        Text("Request status : ${collabdata.documents[q].data['Status']}",
                          style: new TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),),
                        Spacer(),
                      ]),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(12.0),
                        side: BorderSide(color: Colors.grey)
                    ),
                      color: Colors.blue,
                      child: Text('Farmer Profile'),
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DirectedFarmerProfile(transactiondata.documents[i].data['Farmer_email'])));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }else{
        return Container(
          width: 0.0,
          height: 0.0,
        );
      }

  }
  dialogbox(BuildContext context,int i){
    return showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
      return AlertDialog(
        contentPadding: EdgeInsets.only(left: 25, right: 25),
        title: Center(child: Text("Rating")),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: new Column(
                    children: [
                      new Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                                child: new TextField(controller: _controller)
                            ),
                            new PopupMenuButton<String>(
                              icon: const Icon(Icons.arrow_drop_down),
                              onSelected: (String value) {
                                _controller.text = value;
                                this.rating=value;
                              },
                              itemBuilder: (BuildContext context) {
                                return items.map<PopupMenuItem<String>>((String value) {
                                  return new PopupMenuItem(child: new Text(value), value: value);
                                }).toList();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Back'),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();

            },
          ),
          FlatButton(
            child: Text('Submit'),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).pop();
              fobj.addRating({
                'Counter':transactiondata.documents[i].data['Counter'] ,
                'Email': transactiondata.documents[i].data['Email'],
                'Farmer_email': transactiondata.documents[i].data['Farmer_email'],
                'Quantity':transactiondata.documents[i].data['Quantity'],
                'Remain_quantity': transactiondata.documents[i].data['Remain_quantity'],
                'Type': transactiondata.documents[i].data['Type'],
               'Farmer_Rating':this.rating,
                'Buyer_Rating':transactiondata.documents[i].data['Buyer_Rating'],
                'Service_Rating':transactiondata.documents[i].data['Service_Rating']
              },transactiondata.documents[i].documentID).then((result) {
               return AlertDialog(
                 content: Container(
                   child: new Text("added"),
                 ),
               );
              }).catchError((e) {
                print(e);
              });
            },
          ),

        ],
      );
      }
    );
  }
}

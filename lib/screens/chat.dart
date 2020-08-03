import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../crud.dart';
import 'chat_screen.dart';


class Chat extends StatefulWidget {


  final String chatemail;

  Chat(this.chatemail);

  @override
  _ChatState createState() => _ChatState();
}

String recieveremail;

class _ChatState extends State<Chat> {
  QuerySnapshot tokendata;
  crudMethods fobj=new crudMethods();
  final Firestore _firestore = Firestore.instance;
  QuerySnapshot messagedata;
  String name;
  String token;
  bool isseen=false;
  String id,date;
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();


  @override
  void initState(){
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showLongToast();
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );
  }

  Future<void> callback() async {
    String message=messageController.text;
    messageController.clear();

    tokendata = await _firestore.collection('User Token').getDocuments();
    for(int k=0;k<tokendata.documents.length;k++)
    {
      if(widget.chatemail==tokendata.documents[k].documentID)
      {
        token=tokendata.documents[k].data['token'];
      }
    }
    print(token);
    final postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      "notification": {"body": "Message", "title": "You got a message from ${fobj.user.email}"},
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
    if (message.length > 0) {
      await _firestore.collection('Chat').add({
        'text':message,
        'sender':fobj.user.email,
        'reciever':widget.chatemail,
        'date': DateTime.now().toIso8601String().toString(),
        'isseen' : this.isseen,

      }
      );

    }
  }
  @override
  Widget build(BuildContext context) {
    recieveremail=widget.chatemail;
    return new WillPopScope(
        onWillPop: () async {
          return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ChatScreen()));
        },
    child:Scaffold(
          appBar: AppBar(
            title: new Center(child: new Text("Saksham Kisan",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'BeVietnam'),),),
            automaticallyImplyLeading: false,
            elevation: 8,
          ),
          body:SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection('Chat')
                        .orderBy('date',descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      List<DocumentSnapshot> docs = snapshot.data.documents;

                      List<Widget> messages = docs
                          .map((doc) => Message(
                        sender: doc.data['sender'],
                        text: doc.data['text'],
                        reciever: doc.data['reciever'],
                        isseen:doc.data['isseen'],
                        id:doc.documentID,
                        date:doc.data['date'],
                        me: fobj.user.email == doc.data['sender'],
                      ))
                          .toList();

                      return ListView(
                        controller: scrollController,
                        reverse: true,
                        shrinkWrap: true,
                        children: <Widget>[
                          ...messages,
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onSubmitted: (value) => callback(),
                          decoration: InputDecoration(
                            hintText: "Enter a Message...",
                            border: const OutlineInputBorder(),
                          ),
                          controller: messageController,
                        ),
                      ),
                      ButtonTheme(
                        height: 50,
                        child: RaisedButton(

                          child:Text("Send",style: TextStyle(fontSize: 20,fontFamily: 'BeVietnam'),),
                          color:Colors.blueGrey ,

                          onPressed: callback,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
    ),
    );

  }

  void showLongToast() {
    Fluttertoast.showToast(
      msg: "you have got a message",
      toastLength: Toast.LENGTH_LONG,
    );
  }



}
class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.orange,
      onPressed: callback,
      child: Text(text),
    );
  }
}
class Message extends StatelessWidget {

  final String sender;
  final String reciever;
  final String text;
  final bool me;
  final bool isseen;
  final String id;
  final String date;

  const Message({Key key, this.sender, this.text, this.me,this.reciever,this.isseen,this.id,this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    crudMethods fobj=new crudMethods();
    final Firestore _firestore = Firestore.instance;
    if((this.reciever== recieveremail&&this.sender==fobj.user.email)||(this.reciever==fobj.user.email&&this.sender==recieveremail)) {

      if(this.reciever==fobj.user.email)
      {
        _firestore.collection('Chat').document("${id}").setData({
          'text': this.text,
          'sender':this.sender,
          'reciever':this.reciever,
          'date': this.date,
          'isseen' : true,

        }

        );

      }


      return Container(
        margin: me?EdgeInsets.only(left: 130,right: 10):EdgeInsets.only(right: 130,left: 10),
        child: Column(
          crossAxisAlignment:
          me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "",
            ),
            Material(

              color: me ? Colors.green[300]:Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              elevation: 6.0,
              child: Container(

                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Text(
                    text,
                    style: TextStyle(color: me ? Colors.black:Colors.black,fontFamily: 'BeVietnam')
                ),
              ),
            ),
            Container(
              child: me? Icon(Icons.done_all, color: isseen? Colors.blue : Colors.brown):Container(
                width: 0.0,
                height: 0.0,
              ),
            )
          ],
        ),
      );
    }else{
      return new Container(
        width: 0.0,
        height: 0.0,
      );
    }

  }

}

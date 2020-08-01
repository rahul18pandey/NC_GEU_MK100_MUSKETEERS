

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisan_app/Constants/myheader.dart';

import 'package:kisan_app/crud.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../../app_localizations.dart';
class FarmerProfilePage extends StatefulWidget {
  @override
  _FarmerProfilePageState createState() => _FarmerProfilePageState();
}

class _FarmerProfilePageState extends State<FarmerProfilePage> {
  crudMethods fobj = new crudMethods();
  QuerySnapshot farmerprofiledata;
  String a;
  FirebaseUser user;
  double rating;
  SpeechRecognition _speechRecognition;
  bool _isAvailable=true;
  bool _isListening=true ;
  final FlutterTts tts=FlutterTts();
  Locale _currentLocale;
  String resultText = "";
  bool count=false;
  QuerySnapshot transactiondata;
  @override
  void initState() {
    fobj.getFarmerData().then((results) {
      setState(() {
        farmerprofiledata = results;
      });
    });
    fobj.gettransaction().then((results) {
      setState(() {
        transactiondata = results;
      });
    });
    super.initState();
  }
  void initSpeechRecognizer() {
    tts.speak("How can i help you");
    //print("inside Second speech recognizer");
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setRecognitionCompleteHandler(onRecognitionComplete);
    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );
    _currentLocale = Localizations.localeOf(context);
    _speechRecognition.setRecognitionResultHandler(

          (String speech) => setState(() {
        resultText = speech;
        if(resultText!=null|| resultText!="");
        //  launchURL(resultText);
        //print("your last result is function "+resultText);
      }),
    );
    _speechRecognition.stop();

  }
  void onRecognitionComplete() {
    setState(() {
      if(resultText!=null|| resultText!="") {
        // tts.speak("Please wait");
        launchURL(resultText);
      }

    });
  }
  int count1=0;
  launchURL(String resultText) {
    if ((resultText != null && resultText != "")) {
      count1++;
      // print(count1);
      if ((resultText=="back")) {
         if (resultText == "back") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.pop(context,false);
            resultText="";
          }
          count = true;
        }
      }

      else if (count1 >=2) {
        print(count1);
        count1=0;

        tts.speak(resultText + "not able to process");
        resultText="";

      }

    }
  }

  @override
  Widget build(BuildContext context) {
    user = fobj.getUser();
    if(transactiondata!=null){
      int count=0;
      rating=0.0;
      for(int i=0;i<transactiondata.documents.length;i++){
        if(transactiondata.documents[i].data['Farmer_email']==user.email){
          if(transactiondata.documents[i].data['Farmer_Rating']!=""){
            count=count+1;
            rating=(rating+int.parse(transactiondata.documents[i].data['Farmer_Rating']));
          }
        }
      }
     if(rating!=0)
      rating=rating/count;
      print(rating);
    }

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          initSpeechRecognizer();
          if (_isAvailable && _isListening) {
            _speechRecognition
                .listen(locale: "${_currentLocale}")
                .then((result) => print(result));
            count=false;
            count1=0;
          }
          else{
            print("Mar gya");
          }

          // Add your onPressed code here!
        },
        child: Icon(Icons.settings_voice),
        backgroundColor: Colors.green,
      ),
      body:_showProfile(),
    );
  }
  _showProfile(){
    String a=user.email;
    if (farmerprofiledata!= null) {
      for(int i=0;i<farmerprofiledata.documents.length;i++)
      {
        if(a==farmerprofiledata.documents[i].documentID)
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
                                  farmerprofiledata.documents[i]
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
                                subtitle: Text(farmerprofiledata.documents[i]
                                    .data['Phone']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.email),
                                title: Text((AppLocalizations.of(context).translate('34'))),
                                subtitle: Text(farmerprofiledata.documents[i]
                                    .data['Email']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.lock_outline),
                                title: Text((AppLocalizations.of(context).translate('35'))),
                                subtitle: Text(farmerprofiledata.documents[i]
                                    .data['Aadhar']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.home),
                                title: Text((AppLocalizations.of(context).translate('36'))),
                                subtitle: Text(farmerprofiledata.documents[i]
                                    .data['House']),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.map),
                                title: Text((AppLocalizations.of(context).translate('37'))),
                                subtitle: Text( farmerprofiledata.documents[i]
                                    .data['City'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('39'))),
                                subtitle: Text(farmerprofiledata.documents[i]
                                    .data['District'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text( (AppLocalizations.of(context).translate('40'))),
                                subtitle: Text(farmerprofiledata.documents[i]
                                    .data['State'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('41'))),
                                subtitle: Text(farmerprofiledata.documents[i]
                                    .data['Address'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('42'))),
                                subtitle: Text(farmerprofiledata.documents[i]
                                    .data['Pin_code'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('43'))),
                                subtitle: Text(farmerprofiledata.documents[i]
                                    .data['Post'],),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                leading: Icon(Icons.my_location),
                                title: Text((AppLocalizations.of(context).translate('44'))),
                                subtitle: Text(farmerprofiledata.documents[i]
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
    }
    else {
      return Loading();
    }
  }
}


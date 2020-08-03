import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Components/dialog_helper.dart';
import 'package:kisan_app/screens/FarmerScreens/Checkprice.dart';
import 'package:kisan_app/screens/FarmerScreens/recenttransaction.dart';
import 'package:kisan_app/sign_in.dart';
import 'package:kisan_app/youtube/screens/home_screen.dart';
import 'package:speech_recognition/speech_recognition.dart';
import '../../app_localizations.dart';
import '../../crud.dart';
import '../chat_screen.dart';
import '../weather.dart';
import 'Branding.dart';
import 'DailyPrice.dart';
import 'Help.dart';
import 'Transportation.dart';
import 'Fertilizers.dart';
import 'StartSeason.dart';
import 'EndSeason.dart';
import 'MiddleSeason.dart';
import 'add_crop.dart';
import 'farmerprofilepage.dart';
import 'showcrop.dart';
import 'Packaging.dart';
import 'insurance.dart';
import 'Warehouse.dart';
import 'IrrigationSystem.dart';
import 'Branding.dart';
import 'Schemes.dart';
import 'package:firebase_auth/firebase_auth.dart';

const languages = const [
  const Language('English', 'en_US'),
  const Language('Hindi', 'hi_IN'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = true;
  bool _isListening = true;
  final FlutterTts tts = FlutterTts();
  Locale _currentLocale;
  String resultText = "";
  bool count = false;
  crudMethods fobj = new crudMethods();
  QuerySnapshot chatdata;
  @override
  void initState() {
    fobj.getchat().then((results){
      setState((){
        chatdata=results;
      });
    });
    super.initState();
    // initSpeechRecognizer();
  }
  int chatcount=0;
  void initSpeechRecognizer() {
    tts.speak("How can i help you");
    //print("inside speech recognizer");
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setRecognitionCompleteHandler(onRecognitionComplete);
    _speechRecognition.setRecognitionStartedHandler(
          () => setState(() => _isListening = true),
    );
    _currentLocale = Localizations.localeOf(context);
    _speechRecognition.setRecognitionResultHandler(
          (String speech) => setState(() {
        resultText = speech;
      }),
    );

    _speechRecognition.stop();
  }

  void onRecognitionComplete() {
    setState(() {
      //  print("Hey");
      if (resultText != null || resultText != "") {
        // tts.speak("Processing");
        launchURL(resultText);
      }
    });
  }

  int count1 = 0;
  launchURL(String resultText) {
    if ((resultText != null && resultText != "")) {
      count1++;
      print(count1);
      if ((resultText == "tutorial" ||
          resultText == "transportation" ||
          resultText == "crop insurance" ||
          resultText == "branding" ||
          resultText == "my profile" ||
          resultText == "add crop" ||
          resultText == "show crop" ||
          resultText == "irrigation system" ||
          resultText == "branding" ||
          resultText == "fertilizer" ||
          resultText == "packaging" ||
          resultText == "warehouse" ||
          resultText == "government schemes" ||
          resultText == "crop insurance" ||
          resultText == "crop forecasting" ||
          resultText == "start season" ||
          resultText == "middle season" ||
          resultText == "end season" ||
          resultText == "back" ||
          resultText == "weather" ||
          resultText == "logout")) {
        if (resultText == "tutorial") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen1()));
          }
          count = true;
        } else if (resultText == "start season") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StartSeason()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "middle season") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MiddleSeason()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "crop insurance") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Insurance()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "end season") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => EndSeason()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "weather") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WeatherScreen()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "transportation") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Transportation()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "irrigation system") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => IrrigationSystem()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "branding") {
          if (!count) {
            tts.speak("Please wait");
            resultText = "";
          }
          count = true;
        } else if (resultText == "fertilizer") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Fertilizers()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "packaging") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Packaging()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "warehouse") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WareHouse()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "government schemes") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Schemes()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "crop insurance") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Insurance()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "crop forcasting") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CropHelp()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "my profile") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FarmerProfilePage()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "show crop") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ShowCrop()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "logout") {
          if (!count) {
            tts.speak("Please wait");
            _firebaseAuth.signOut();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "add crop") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddCrop()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "branding") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Collaboration()));
            resultText = "";
          }
          count = true;
        } else if (resultText == "back") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.pop(context);
            resultText = "";
          }
          count = true;
        }
      } else if (count1 >= 1) {
        count1 = 0;
        tts.speak("Not able to process");
        tts.speak(resultText + "is not a service");
        resultText = "";
      }
    }
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if(chatdata!=null){
      for(int k=0;k<chatdata.documents.length;k++)
      {
        if(chatdata.documents[k].data['reciever']==fobj.user.email){
          if(!chatdata.documents[k].data['isseen']){
            chatcount++;
          }
        }
      }}
    return new WillPopScope(
      onWillPop: () async {
        return await DialogHelper.exit(context);
      },
      child: Scaffold(
        appBar: new AppBar(
          title: Center(
              child: (Text(
                AppLocalizations.of(context).translate('first_string'),
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
              ))),
          brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: Color(0xFF637BFF),
          actions: <Widget>[
            IconButton(
              icon: new Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    new Icon(Icons.message),
                    new Positioned(
                        top: -1.0,
                        right: -6.0,
                        child: new Container(
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(4.0), color: Colors.red),
                          width: 16.0,
                          child: Center(
                            child: new Text(
                              "${chatcount}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ))
                  ]
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ChatScreen()));
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            initSpeechRecognizer();
            if (_isAvailable && _isListening) {
              _speechRecognition
                  .listen(locale: "${_currentLocale}")
                  .then((result) => print("started"));
              count = false;
              count1 = 0;
            } else {
              print("Mar gya");
            }
          },
          child: Icon(Icons.settings_voice),
          backgroundColor: Colors.green,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  setState(() {});
                  Navigator.pop(context);
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('16')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/home.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FarmerProfilePage()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('17')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/user.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowCrop()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('18')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/package.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCrop()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('19')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/add.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecentTransaction()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('74')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(image: AssetImage('images/recent.png'),width: 36,height: 36,),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Transportation()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('8')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/transport.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Fertilizers()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('11')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/fertilizers.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Packaging()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('12')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/package.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WareHouse()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('13')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/warehouse.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IrrigationSystem()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('9')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/irrigation.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Schemes()),
                  );
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('14')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/branding.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Insurance()),
                  );
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('20')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/insurance.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen1()),
                  );
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('15')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Image(
                    image: AssetImage('images/tut.png'),
                    width: 36,
                    height: 36,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  _firebaseAuth.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: ListTile(
                  title: Text(
                    (AppLocalizations.of(context).translate('23')),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.keyboard_return,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
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
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Image(
                              image: AssetImage('images/croprotation.jpg'),
                              width: 200,
                              height: 200,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              (AppLocalizations.of(context).translate('2')),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/test1.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context).translate('3')),
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StartSeason()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/test2.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context).translate('4')),
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MiddleSeason()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/test.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context).translate('5')),
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EndSeason()),
                              );
                            },
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage('images/2282.jpg'),
                              width: 200,
                              height: 200,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Text(
                              (AppLocalizations.of(context).translate('6')),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontSize: 30.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Icon(
                                  Icons.directions_bus,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  (AppLocalizations.of(context).translate('7')),
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WeatherScreen()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Icon(
                                  Icons.directions_bus,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  "Check Daily Price",
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DailyPrice()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/test3.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context).translate('8')),
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Transportation()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/irrigation.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context).translate('9')),
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat"),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IrrigationSystem()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/branding.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context)
                                      .translate('10')),
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 20.0,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat"),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Collaboration()));
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/fertilizer.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context)
                                      .translate('11')),
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Fertilizers()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/package.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context)
                                      .translate('12')),
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Packaging()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/warehouse.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context)
                                      .translate('13')),
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WareHouse()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/govern.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context)
                                      .translate('14')),
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Schemes()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/insurance.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context)
                                      .translate('20')),
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Insurance()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(
                                      'images/tut.png',
                                    )),
                                title: Text(
                                  (AppLocalizations.of(context)
                                      .translate('15')),
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen1()),
                              );
                            },
                          ),
                          FlatButton(
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Icon(Icons.help),
                                title: Text(
                                  (AppLocalizations.of(context)
                                      .translate("73")),
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 20.0,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CropHelp()),
                              );
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
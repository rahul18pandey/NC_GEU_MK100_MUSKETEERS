import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kisan_app/screens/FarmerScreens/showcrop.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../../app_localizations.dart';
import 'Packaging.dart';
import 'Transportation.dart';
import 'Warehouse.dart';
const languages = const [
  const Language('English', 'en_US'),
  const Language('Hindi', 'hi_IN'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}
class EndSeason extends StatefulWidget {
  @override
  _EndSeasonState createState() => _EndSeasonState();
}

class _EndSeasonState extends State<EndSeason> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable=true;
  bool _isListening=true ;
  final FlutterTts tts=FlutterTts();
  Locale _currentLocale;
  String resultText = "";
  bool count=false;
  @override
  void initState() {
    super.initState();
  }
  void initSpeechRecognizer() {
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
      if (( resultText == "transportation" ||
          resultText == "packaging" || resultText=="sell crop"||
          resultText == "warehouse"||resultText=="back")) {
        if (resultText == "sell crop") {
          if (!count) {

            tts.speak("Please wait");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ShowCrop()));
            resultText="";
          }
          count = true;
        }

        else if (resultText == "packaging") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Packaging()));
            resultText="";
          }
          count = true;
        }
        else if (resultText == "warehouse") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WareHouse()));
            resultText="";
          }
          count = true;
        }
        else if (resultText == "transportation") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Transportation()));
            resultText="";
          }
          count = true;
        }
        else if (resultText == "back") {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text((AppLocalizations.of(context).translate('5')),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
        elevation: 0,
        backgroundColor: Color(0xFF637BFF),
      ),
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            colors: [Color(0xFF637BFF),Color(0XFF21C8F6)],
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          width: double.infinity,
          //height: 400,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image(image: AssetImage('images/endseason.jpg'),width: 250,height: 250,),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                (AppLocalizations.of(context).translate('6')),
                style: TextStyle(
                  fontFamily: "Pacifico",
                  fontSize: 35,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(height: 8,),
              FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/transport.png')),
                      title: Text(
                        (AppLocalizations.of(context).translate('8')),
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Transportation()));
                  }),
              SizedBox(
                height: 8.0,
              ),
              FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/package.png')),
                      title: Text(
                        (AppLocalizations.of(context).translate('12')),
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Packaging()));
                  }),
              SizedBox(
                height: 8.0,
              ),
              FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/warehouse.png')),
                      title: Text(
                        (AppLocalizations.of(context).translate('13')),
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WareHouse()));
                  }),
              SizedBox(height: 8.0,),
              FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(
                        Icons.attach_money,
                        size: 28,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        (AppLocalizations.of(context).translate('30')),
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowCrop()));
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          initSpeechRecognizer();
          if (_isAvailable && _isListening) {
            _speechRecognition
                .listen(locale: "${_currentLocale}")
                .then((result) => tts.speak("How can i help you"));
            count=false;
            count1=0;
          }
          else{
            print("Mar gya");
          }
          // Add your onPressed code here!
        },
        child: Icon(Icons.settings_voice),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}
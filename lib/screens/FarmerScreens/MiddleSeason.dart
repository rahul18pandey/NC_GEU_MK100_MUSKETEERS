import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kisan_app/youtube/screens/home_screen.dart';
import 'package:speech_recognition/speech_recognition.dart';
import '../../app_localizations.dart';
import 'IrrigationSystem.dart';
import 'Fertilizers.dart';
import '../weather.dart';
const languages = const [
  const Language('English', 'en_US'),
  const Language('Hindi', 'hi_IN'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}
class MiddleSeason extends StatefulWidget {
  @override
  _MiddleSeasonState createState() => _MiddleSeasonState();
}

class _MiddleSeasonState extends State<MiddleSeason> {

  SpeechRecognition _speechRecognition;
  bool _isAvailable=true;
  bool _isListening=true ;
  final FlutterTts tts=FlutterTts();

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
      if (( resultText == "irrigation system" ||
          resultText == "fertilizer" || resultText=="tutorial"||
          resultText == "weather"||resultText=="back")) {
        if (resultText == "fertilizer") {
          if (!count) {

            tts.speak("Please wait");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Fertilizers()));
            resultText="";
          }
          count = true;
        }

        else if (resultText == "weather") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeatherScreen()));
            resultText="";
          }
          count = true;
        }
        else if (resultText == "tutorial") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeScreen1()));
            resultText="";
          }
          count = true;
        }
        else if (resultText == "irrigation system") {
          if (!count) {
            tts.speak("Please wait");

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => IrrigationSystem()));
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

        tts.speak(resultText + "is not a service");
        resultText="";

      }

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text((AppLocalizations.of(context).translate('6')),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
        backgroundColor: Color(0xFF637BFF),
        elevation: 0,
        automaticallyImplyLeading: true,
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
                child: Image(image: AssetImage('images/middleseason.jpg'),width: 250,height: 250,),
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
                      leading: Image(image: AssetImage('images/fertilizer.png')),
                      title: Text(
                        (AppLocalizations.of(context).translate('11')),
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
                        MaterialPageRoute(builder: (context) => Fertilizers()));
                  }),
              SizedBox(
                height: 8.0,
              ),
              FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/irrigation.png')),
                      title: Text(
                        (AppLocalizations.of(context).translate('9')),
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
                            builder: (context) => IrrigationSystem()));
                  }),
              SizedBox(
                height: 8.0,
              ),
              FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/tut.png')),
                      title: Text(
                        (AppLocalizations.of(context).translate('15')),
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
                          builder: (context) => HomeScreen1()),
                    );
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
                .listen(locale: "en_US")
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
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}





import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:kisan_app/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:kisan_app/crud.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../../app_localizations.dart';


class AddCrop extends StatefulWidget {
  @override

  _AddCropState createState() => _AddCropState();
}

class _AddCropState extends State<AddCrop> {

  crudMethods fobj=new crudMethods();
  final TextEditingController _controller = new TextEditingController();

  FirebaseUser user;
  String quantity='0';
  String address='';
  String type='';
  DateTime auctiondate;
  DateTime viewdate;
  String phone='';
  String price='';
  SpeechRecognition _speechRecognition;
  bool _isAvailable=true;
  bool _isListening=true ;
  final FlutterTts tts=FlutterTts();
  Locale _currentLocale;
  String resultText = "";
  bool count=false;

  Widget _buildTypeTF() {
    var items = [(AppLocalizations.of(context).translate('57')), (AppLocalizations.of(context).translate('58')), (AppLocalizations.of(context).translate('59')),(AppLocalizations.of(context).translate('60')),(AppLocalizations.of(context).translate('61')),(AppLocalizations.of(context).translate('62')),(AppLocalizations.of(context).translate('63')),(AppLocalizations.of(context).translate('64')),];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          (AppLocalizations.of(context).translate('56')),
          style: kLabelStyle,
        ),

        Container(
          child: new Column(
            children: [
              new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextField(controller: _controller),
                    ),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),

                      onSelected: (String value) {

                        _controller.text = value;
                        this.type=value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items.map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(child: new Text(value), value: value,);
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
    );
  }


  Widget takequantity() {
    return Container(
      margin: EdgeInsets.only(top: 40,left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            (AppLocalizations.of(context).translate('65'))+" : ",
            style: kLabelStyle,
          ),

          SizedBox(height: 5.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value){
               this.quantity=value;
              },
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),


              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 4.0),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.grey)
              ),
              color: Colors.green,
              child: Text("go",style: TextStyle(color: Colors.black),),
              onPressed: (){
                (context as Element).reassemble();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAddressTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          (AppLocalizations.of(context).translate('67'))+" : ",
          style: kLabelStyle,
        ),

        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            onChanged: (value){
              this.address=value;
            },
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),

            decoration: InputDecoration(

              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),

            ),
          ),
        ),
      ],
    );
  }
  Widget _buildphoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          (AppLocalizations.of(context).translate('66'))+" : ",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value){
              this.phone=value;
            },
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),


            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildauctionTF() {
    int q=int.parse(this.quantity);
  if(q>100) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          (AppLocalizations.of(context).translate('46'))+" : ",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
       child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[

    FlatButton(
      child: Text(auctiondate==null ? '                                                        ' : auctiondate.toString()),
      onPressed: (){
        showDatePicker(
            context: context,
            initialDate: auctiondate == null ? DateTime.now() : auctiondate,
            firstDate: DateTime(2020),
            lastDate: DateTime(2021)
        ).then((date) {
          setState(() {
            auctiondate = date;
          });
        });
      }
    )
         ],
       )
        ),
      ],
    );
  }return Container(
      width: 0.0,
      height: 0.0,
    );

  }
  Widget _buildpriceTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          (AppLocalizations.of(context).translate('68'))+" : ",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value){
              this.price=value;
            },
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),


            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildviewTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          (AppLocalizations.of(context).translate('69'))+" : ",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                FlatButton(
                    child: Text(viewdate==null ? '                                                             ' : viewdate.toString()),
                    onPressed: (){
                      showDatePicker(
                          context: context,
                          initialDate: viewdate == null ? DateTime.now() : viewdate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2021)
                      ).then((date) {
                        setState(() {
                          viewdate = date;
                        });
                      });
                    }
                )
              ],
            )
        ),
      ],
    );
  }


  Widget _buildsubmitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: (){
          submitCrop();
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.blue,
        child: Text(
          (AppLocalizations.of(context).translate('71')),
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  submitCrop(){
    user= fobj.getUser();
    Navigator.of(context).pop();
    int q=int.parse(this.quantity);
    if(q>100) {
      fobj.addcropdata({
      'Quantity': this.quantity,
      'Auction_date': "${auctiondate.day}-${auctiondate.month}-${auctiondate.year}",
      'Address': this.address,
      'Phone':this.phone,
      'View_date':"${viewdate.day}-${viewdate.month}-${viewdate.year}",
      'Type':this.type,
      'Base_price':this.price,
      'Email':user.email,
      'Current_bid':0,
    }).then((result) {
      dialogTrigger(context);
    }).catchError((e) {
      print(e);
    });
    }else{
      fobj.addcropdata({
        'Quantity': this.quantity,
        'Address': this.address,
        'Phone':this.phone,
        'View_date':"${viewdate.day}-${viewdate.month}-${viewdate.year}",
        'Type':this.type,
        'Base_price':this.price,
        'Email':user.email,
      }).then((result) {
        dialogTrigger(context);
      }).catchError((e) {
        print(e);
      });
    }
  }



  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text((AppLocalizations.of(context).translate('70')), style: TextStyle(fontSize: 15.0)),
          actions: <Widget>[
            FlatButton(
              child: Text((AppLocalizations.of(context).translate('72')),),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle:true,
        title: Text('Add Crop', textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
        backgroundColor: Color(0xFF637BFF),
        elevation: 0,
      ),
      body:DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 1.0],
        colors: [Color(0xFF637BFF),Color(0XFF21C8F6)],
    ),
    ),
     child: quantity=='0'?takequantity():AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[

              Container(
                height: double.infinity,
                width: double.infinity,

              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 60.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildTypeTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildphoneTF(),
                      SizedBox(
                        height: 10.0,
                      ),

                      _buildAddressTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildpriceTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildviewTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildauctionTF(),
                      SizedBox(
                        height: 10.0,
                      ),



                      _buildsubmitBtn(),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          initSpeechRecognizer();
          if (_isAvailable && _isListening) {
            _speechRecognition
                .listen(locale: "${_currentLocale}")
                .then((result) => tts.speak("How can I help you"));
            count=false;
            count1=0;
          }
        },
        child: Icon(Icons.settings_voice),
        backgroundColor: Colors.green,
      ),
    );
  }

  void initSpeechRecognizer() {
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
        // if(resultText!=null|| resultText!="") {
        // tts.speak("Processing");
        //launchURL(resultText);
        // }
        //  print("your last result is function "+resultText);
      }),
    );

    _speechRecognition.stop();


  }
  void onRecognitionComplete() {
    setState(() {
      //  print("Hey");
      if(resultText!=null|| resultText!="") {
        // tts.speak("Processing");
        launchURL(resultText);
      }

    });
  }

  int count1=0;
  launchURL(String resultText){

    if((resultText!=null && resultText!="" )) {
      count1++;
      resultText=resultText.toLowerCase();
      if(resultText=="submit"){
        if (resultText == "submit") {
          if (!count) {
            tts.speak("Please wait");
            submitCrop();
          }
          count = true;
        }

        else if (resultText == "back") {
          if (!count) {
            tts.speak("Please wait");
            Navigator.pop(context);
            resultText="";
          }
          count = true;
        }
      }
      else if(count1>=2) {
        print(count1);
        count1=0;

        tts.speak(resultText + "not able to process");
        resultText="";
      }

    }

  }
}
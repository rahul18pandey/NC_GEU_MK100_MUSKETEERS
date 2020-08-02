
import 'dart:typed_data';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:kisan_app/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:kisan_app/crud.dart';
import 'package:kisan_app/screens/FarmerScreens/HomePage.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../../app_localizations.dart';


class AddCrop extends StatefulWidget {
  @override

  _AddCropState createState() => _AddCropState();
}

class _AddCropState extends State<AddCrop> {

  crudMethods fobj=new crudMethods();
  final TextEditingController _controller = new TextEditingController();
  StorageReference storageReference = FirebaseStorage.instance.ref().child("crop photos");
  FirebaseUser user;
  String quantity='0';
  String address='';
  String type='';
  DateTime auctiondate;
  DateTime viewdate;
  String phone='';
  String price='';
  File _imageFile;
  SpeechRecognition _speechRecognition;
  bool _isAvailable=true;
  bool _isListening=true ;
  final FlutterTts tts=FlutterTts();
  Locale _currentLocale;
  String resultText = "";
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool count=false;
  Future getImage() async {
    File image;
    image = (await ImagePicker.pickImage(source: ImageSource.camera)) as File;
    setState(() {
      _imageFile = image;
    });
  }

  Widget _buildTypeTF() {
    var items = [(AppLocalizations.of(context).translate('57')), (AppLocalizations.of(context).translate('58')), (AppLocalizations.of(context).translate('59')),(AppLocalizations.of(context).translate('60')),(AppLocalizations.of(context).translate('61')),(AppLocalizations.of(context).translate('62')),(AppLocalizations.of(context).translate('63')),(AppLocalizations.of(context).translate('64')),];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          (AppLocalizations.of(context).translate('56')),
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 18
          ),
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
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),
          ),

          SizedBox(height: 10.0),
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
              child: Text("Go",style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: "Montserrat"),),
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
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 18
          ),
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
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 18
          ),
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
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 18
            ),
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
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 18
          ),
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
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 18
          ),
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
  submitCrop()async{
    user= fobj.getUser();
    int q=int.parse(this.quantity);
    if(_imageFile!=null) {
      showLoadingDialog(context, _keyLoader);
      final StorageReference firebaseStorgaeRef = FirebaseStorage
          .instance.ref().child("crop photos"+"/"+fobj.user.email+this.quantity+this.phone+this.price);
      // ignore: deprecated_member_use
      final StorageUploadTask task = firebaseStorgaeRef.putFile(_imageFile);
      StorageTaskSnapshot taskSnapshot = await task.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL();
      if (q > 100) {
        fobj.addcropdata({
          'Quantity': this.quantity,
          'Auction_date': "${auctiondate.day}-${auctiondate.month}-${auctiondate
              .year}",
          'Address': this.address,
          'Phone': this.phone,
          'View_date': "${viewdate.day}-${viewdate.month}-${viewdate.year}",
          'Type': this.type,
          'Base_price': this.price,
          'Email': user.email,
          'Current_bid': 0,
          'URL':url
        }).then((result) {
          Navigator.of(
              _keyLoader.currentContext,
              rootNavigator: true).pop();
          dialogTrigger(context);
        }).catchError((e) {
          print(e);
        });
      } else {
        fobj.addcropdata({
          'Quantity': this.quantity,
          'Address': this.address,
          'Phone': this.phone,
          'View_date': "${viewdate.day}-${viewdate.month}-${viewdate.year}",
          'Type': this.type,
          'Base_price': this.price,
          'Email': user.email,
          'URL':url
        }).then((result) {
          Navigator.of(
              _keyLoader.currentContext,
              rootNavigator: true).pop();
          dialogTrigger(context);
        }).catchError((e) {
          print(e);
        });
      }
    }
    else{
      imagedialog(context);
    }
  }

  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait Uploading....",style: TextStyle(color: Colors.blueAccent,fontFamily: 'BeVietnam',),)
                      ]),
                    )
                  ]));
        });
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => HomeScreen()));
              },
            )
          ],
        );
      },
    );
  }

  Future<bool> imagedialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("please add crop image", style: TextStyle(fontSize: 15.0)),
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
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.grey)),
                            color: Colors.blue,
                          child: Text("add crop image"),
                          onPressed: getImage
                        ),
                        Container(
                          child: _imageFile==null?Text(""):Image.file(_imageFile,height: 300.0,width: 300.0,),
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
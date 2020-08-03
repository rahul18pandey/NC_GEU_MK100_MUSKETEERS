import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kisan_app/app_localizations.dart';

class Insurance extends StatefulWidget {
  @override
  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {

  String URL="http://dadf.gov.in/related-links/livestock-insurance";
  String URL1="https://www.cholainsurance.com/pradhan-mantri-fby.html";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: new Text((AppLocalizations.of(context).translate('89')),textAlign: TextAlign.center,)),
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xFF637BFF),
          elevation: 0,
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
          child:SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 5,),
                Container(
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                            child: Row(children: <Widget>[
                              Expanded(flex:30,
                                child:Container(
                                  child: Text((AppLocalizations.of(context).translate('90')),
                                    style: new TextStyle(
                                        fontSize: 20.0, fontWeight: FontWeight.bold),),
                                ), ),
                              Spacer(),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                            child: Row(children: <Widget>[
                              Expanded(
                                flex: 30,
                                child:Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text((AppLocalizations.of(context).translate('91')),
                                    style: new TextStyle(
                                      fontSize: 20.0,),),
                                ),
                              ),

                              Spacer(),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 10.0,left: 230),
                            child: Row(children: <Widget>[
                              RaisedButton(shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                  side: BorderSide(color: Colors.grey)
                              ),
                                color: Colors.blue,
                                onPressed: ()async{
                                  if(await canLaunch(URL)){
                                    await launch(URL);
                                  }
                                  else{
                                    print("no");
                                  }
                                },
                                child: Text((AppLocalizations.of(context).translate('92')),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white)),),


                            ]),
                          ),
                        ],
                      ),
                    ),

                  ),

                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                            child: Row(children: <Widget>[
                              Expanded(
                                  flex:30,
                                  child:Container (
                                    child: Text((AppLocalizations.of(context).translate('93')),
                                      style: new TextStyle(
                                          fontSize: 20.0, fontWeight: FontWeight.bold),),
                                  ) ),

                              Spacer(),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                            child: Row(children: <Widget>[
                              Expanded(
                                flex: 30,
                                child:Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text((AppLocalizations.of(context).translate('94')),
                                    style: new TextStyle(
                                      fontSize: 20.0,),),
                                ),
                              ),

                              Spacer(),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 10.0,left: 230),
                            child: Row(children: <Widget>[
                              RaisedButton(shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                  side: BorderSide(color: Colors.grey)
                              ),
                                color: Colors.blue,
                                onPressed: ()async{
                                  if(await canLaunch(URL1)){
                                    await launch(URL1);
                                  }
                                  else{
                                    print("no");
                                  }
                                },
                                child: Text((AppLocalizations.of(context).translate('92')),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white)),),


                            ]),
                          ),
                        ],
                      ),
                    ),

                  ),

                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
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
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                            child: Row(children: <Widget>[
                              Expanded(flex:30,
                                child:Container(
                                  child: Text((AppLocalizations.of(context).translate('95')),
                                    style: new TextStyle(
                                        fontSize: 20.0, fontWeight: FontWeight.bold),),
                                ), ),
                              Spacer(),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                            child: Row(children: <Widget>[
                              Expanded(
                                flex: 30,
                                child:Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text((AppLocalizations.of(context).translate('96')),
                                    style: new TextStyle(
                                      fontSize: 20.0,),),
                                ),
                              ),

                              Spacer(),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0, bottom: 10.0,left: 230),
                            child: Row(children: <Widget>[
                              RaisedButton(shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                  side: BorderSide(color: Colors.grey)
                              ),
                                color: Colors.blue,
                                onPressed: ()async{
                                  if(await canLaunch(URL)){
                                    await launch(URL);
                                  }
                                  else{
                                    print("no");
                                  }
                                },
                                child: Text((AppLocalizations.of(context).translate('92')),style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white)),),


                            ]),
                          ),
                        ],
                      ),
                    ),

                  ),

                ),


              ],
            ),
          ),
        )
    );
  }
}
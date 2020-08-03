import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kisan_app/app_localizations.dart';
class Schemes extends StatefulWidget {
  @override
  _SchemesState createState() => _SchemesState();
}

class _SchemesState extends State<Schemes> {

  String URL="https://www.pmkisan.gov.in/";
  String URL1="https://pmkmy.gov.in/";
String URL2="https://pmfby.gov.in/";
String URL3="https://soilhealth.dac.gov.in/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: new Text((AppLocalizations.of(context).translate('97')),textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600))),
        automaticallyImplyLeading: true,
        elevation: 0,

        backgroundColor: Color(0xFF637BFF),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.settings_voice),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              SizedBox(height: 5,),
              Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
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
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                          child: Row(children: <Widget>[
                            Text((AppLocalizations.of(context).translate('98')),
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),),

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
                                child: Text((AppLocalizations.of(context).translate('99')),
                                  style: new TextStyle(
                                    fontSize: 20.0,),),
                              ),
                            ),

                            Spacer(),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0,left: 220.0),
                          child: Row(children: <Widget>[
                            RaisedButton(shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.red)
                            ),
                              color: Colors.green,
                              onPressed: ()async{
                                if(await canLaunch(URL)){
                                  await launch(URL);
                                }
                                else{
                                  print("no");
                                }
                              },
                            child: Text((AppLocalizations.of(context).translate('92')),style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0)),),


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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
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
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                          child: Row(children: <Widget>[
                            Text((AppLocalizations.of(context).translate('100')),
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),),

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
                                child: Text((AppLocalizations.of(context).translate('101')),
                                  style: new TextStyle(
                                    fontSize: 20.0,),),
                              ),
                            ),

                            Spacer(),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0,left: 220),
                          child: Row(children: <Widget>[
                            RaisedButton(shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.grey)
                            ),
                              color: Colors.green,
                              onPressed: ()async{
                                if(await canLaunch(URL2)){
                                  await launch(URL2);
                                }
                                else{
                                  print("no");
                                }
                              },
                              child: Text((AppLocalizations.of(context).translate('92')),style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0)),),


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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
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
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                          child: Row(children: <Widget>[

                            Expanded(
                              flex: 30,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text((AppLocalizations.of(context).translate('102')),
                                  style: new TextStyle(
                                      fontSize: 20.0, fontWeight: FontWeight.bold),),
                              ),
                            ),

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
                                child: Text((AppLocalizations.of(context).translate('103')),
                                  style: new TextStyle(
                                    fontSize: 20.0,),),
                              ),
                            ),

                            Spacer(),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0, left: 220),
                          child: Row(children: <Widget>[
                            RaisedButton(shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.grey)
                            ),
                              color: Colors.green,
                              onPressed: ()async{
                                if(await canLaunch(URL3)){
                                  await launch(URL3);
                                }
                                else{
                                  print("no");
                                }
                              },
                              child: Text((AppLocalizations.of(context).translate('92')),style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0)),),


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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
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
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                          child: Row(children: <Widget>[
                            Text((AppLocalizations.of(context).translate('106')),
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),),

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
                                child: Text((AppLocalizations.of(context).translate('107')),
                                  style: new TextStyle(
                                    fontSize: 20.0,),),
                              ),
                            ),

                            Spacer(),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0,left: 220),
                          child: Row(children: <Widget>[
                            RaisedButton(shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.grey)
                            ),
                              color: Colors.green,
                              onPressed: ()async{
                                if(await canLaunch(URL1)){
                                  await launch(URL1);
                                }
                                else{
                                  print("no");
                                }
                              },
                              child: Text("Know More",style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0)),),


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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
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
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                          child: Row(children: <Widget>[
                            Text((AppLocalizations.of(context).translate('104')),
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),),

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
                                child: Text((AppLocalizations.of(context).translate('105')),
                                  style: new TextStyle(
                                    fontSize: 20.0,),),
                              ),
                            ),

                            Spacer(),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0,left: 220),
                          child: Row(children: <Widget>[
                            RaisedButton(shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(12.0),
                                side: BorderSide(color: Colors.grey)
                            ),
                              color: Colors.green,
                              onPressed: ()async{
                                if(await canLaunch(URL1)){
                                  await launch(URL1);
                                }
                                else{
                                  print("no");
                                }
                              },
                              child: Text((AppLocalizations.of(context).translate('92')),style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0)),),


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

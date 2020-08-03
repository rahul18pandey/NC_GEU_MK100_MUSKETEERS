import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../app_localizations.dart';
class DailyPrice extends StatefulWidget {
  @override
  _DailyPriceState createState() => _DailyPriceState();
}

class _DailyPriceState extends State<DailyPrice> {
  var notesJson=null;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle:true,
        title: Text("Daily Price Of crops", textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
        backgroundColor: Color(0xFF637BFF),
        elevation: 0,
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(
            icon: new Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  new Icon(Icons.data_usage),
                ]
            ),
            onPressed: () {
              getdata();
            },
          )
        ],
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
        child: notesJson==null?Text("Press button to load data") :new ListView.builder(
                itemCount: 29,
                itemBuilder: (BuildContext context, int index) =>
                    builddata(context, index),
              ),
            )

    );
  }

  Widget builddata(BuildContext context,int i)  {
    return new Container(
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Text("Mandi Name",
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                Text(notesJson['records'][i]['market'].toString(),
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Text(notesJson['records'][i]['commodity'].toString(),
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Text("minimum price : ",
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                Text(notesJson['records'][i]['min_price'].toString(),
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Text("maximum price : ",
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                Text(notesJson['records'][i]['max_price'].toString(),
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                Spacer(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Text("model price : ",
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                Text(notesJson['records'][i]['modal_price'].toString(),
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat'),),
                Spacer(),
              ]),
            ),
          ],
        ),

      ),
    );
  }
  void getdata()async{
    var url = 'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd000001fc1c348885364ab564460e6281900cea&format=json&offset=0&limit=170&filters[state]=Uttar%20Pradesh';
    var response = await get(url);
    if (response.statusCode == 200) {
      notesJson = json.decode(response.body);
      print(notesJson['records'][0]['state']);
    }
    (context as Element).reassemble();
  }

}

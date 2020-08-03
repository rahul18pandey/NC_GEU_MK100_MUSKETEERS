import 'dart:convert';

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../app_localizations.dart';
class DailyPrice extends StatefulWidget {
  @override
  _DailyPriceState createState() => _DailyPriceState();
}

class _DailyPriceState extends State<DailyPrice> {
  String selected = null;
  var notesJson = null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text((AppLocalizations.of(context).translate('137')), textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.w600),),
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
        body: notesJson == null ? _dropDownMenu() : new ListView.builder(
        itemCount: 29,
        itemBuilder: (BuildContext context, int index) =>
        builddata(context, index),
        ));
  }

  Widget builddata(BuildContext context, int i) {
    try {
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
                  Text((AppLocalizations.of(context).translate('138')),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),),
                  Text(notesJson['records'][i]['market'].toString(),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text((AppLocalizations.of(context).translate('139')),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),),
                  Flexible(
                    flex: 5,
                    child: Text(notesJson['records'][i]['commodity'].toString(),
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Montserrat'),),
                  ),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text((AppLocalizations.of(context).translate('140')),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),),
                  Text(notesJson['records'][i]['min_price'].toString(),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text((AppLocalizations.of(context).translate('141')),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),),
                  Text(notesJson['records'][i]['max_price'].toString(),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),),
                  Spacer(),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
                child: Row(children: <Widget>[
                  Text((AppLocalizations.of(context).translate('142')),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),),
                  Text(notesJson['records'][i]['modal_price'].toString(),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Montserrat'),),
                  Spacer(),
                ]),
              ),
            ],
          ),

        ),
      );
    }catch(Exception){
      return Container(
        width: 0.0,
        height: 0.0,
      );
    }
  }

  void getdata() async {
    var url = 'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd000001fc1c348885364ab564460e6281900cea&format=json&offset=0&limit=170&filters[state]=${selected}';
    var response = await get(url);
    if (response.statusCode == 200) {
      notesJson = json.decode(response.body);
      print(notesJson['records'][0]['state']);
    }
    (context as Element).reassemble();
  }
  Widget _dropDownMenu(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: DropDownFormField(
            titleText: (AppLocalizations.of(context).translate('143')),
            hintText: (AppLocalizations.of(context).translate('144')),
            value: selected,
            onSaved: (value) {
              setState(() {
                selected = value;
              });
            },
            onChanged: (value) {
              setState(() {
                selected = value;
              });
            },
            dataSource: [
              {
                "display": (AppLocalizations.of(context).translate('145')),
                "value": "Andhra Pradesh",
              },
              {
                "display": (AppLocalizations.of(context).translate('146')),
                "value": "Chattisgarh",
              },
              {
                "display": (AppLocalizations.of(context).translate('147')),
                "value": "Gujarat",
              },
              {
                "display": (AppLocalizations.of(context).translate('148')),
                "value": "Karnataka",
              },
              {
                "display": (AppLocalizations.of(context).translate('149')),
                "value": "Kerala",
              },
              {
                "display": (AppLocalizations.of(context).translate('150')),
                "value": "Maharashtra",
              },
              {
                "display": (AppLocalizations.of(context).translate('151')),
                "value": "Uttar Pradesh",
              },

            ],
            textField: 'display',
            valueField: 'value',
          ),
        ),
        RaisedButton(
          child: Text((AppLocalizations.of(context).translate('71')),style: TextStyle(fontSize: 18,color: Colors.white),),
          color: Colors.green,
          onPressed: () {
            getdata();
          },
        )
      ],
    );
  }
}
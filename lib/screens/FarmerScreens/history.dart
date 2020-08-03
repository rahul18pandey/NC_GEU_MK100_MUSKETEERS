import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';

import '../../crud.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  String selected=null;
  crudMethods fobj = new crudMethods();
  QuerySnapshot apidata;
  @override
  void initState() {
    fobj.getapidata().then((results) {
      setState(() {
        apidata = results;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    if(apidata!=null) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle:true,
          title: Text("Check Past Data", textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
          backgroundColor: Color(0xFF637BFF),
          elevation: 0,
        ),
        body:
        selected ==null ? takeyear() : new ListView.builder(
          itemCount: apidata.documents.length,
          itemBuilder: (BuildContext context, int index) =>
              buildcropCard(context, index),
        ),
      );

    }else{
      return Loading();
    }
  }
  Widget buildcropCard(BuildContext context, int i) {

    return new Container(
      margin: EdgeInsets.all(20),
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
                Text("Crop : ${apidata.documents[i].data['crop']}",
                  style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800),),

              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Flexible(
                  child: Text("Quantity Sold(In Kg) : ${apidata.documents[i].data['quantity']}",
                    style: new TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.w800,),),
                ),

              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Flexible(
                  child: Text("Average Price(per kg): ${apidata.documents[i].data['bid_price']}",
                    style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,),),
                ),

              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Flexible(
                  child: Text("District : ${apidata.documents[i].data['district']}",
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w800),),
                ),

              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              child: Row(children: <Widget>[
                Flexible(
                  child: Text("State : ${apidata.documents[i].data['state']}",
                    style: new TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w800,),),
                ),

              ]),
            ),
          ],
        ),

      ),
    );
  }
  Widget takeyear(){
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(16),
            child: DropDownFormField(
              titleText: 'Year',
              hintText: 'Please choose one',
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
                  "display": "2020",
                  "value": "2020",
                },
              ],
              textField: 'display',
              valueField: 'value',
            )
        ),
        RaisedButton(
          child: Text("go"),
          onPressed: (){
            (context as Element).reassemble();
          },
        )
      ],
    );
  }
}
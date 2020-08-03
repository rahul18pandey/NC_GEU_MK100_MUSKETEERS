import 'package:flutter/material.dart';

import '../../constants.dart';


class CropHelp extends StatefulWidget {
  @override
  _CropHelpState createState() => _CropHelpState();
}

class _CropHelpState extends State<CropHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent[100],
        elevation: 0,
      ),
      body: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.0, 0.0),
            colors: [Colors.indigoAccent[100], Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
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
                child: FlatButton(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(children: <Widget>[
                              Text("Crop On Demand",
                                style: new TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.bold),),
                              Spacer(),
                            ]),
                          ),

                        ],
                      ),

                    ),
                  ),
                  onPressed: (){
                    addDialog2(context);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
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
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(children: <Widget>[
                            Text("Crop On high price",
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),),
                            Spacer(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
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
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(children: <Widget>[
                            Text("Crop for export",
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),),
                            Spacer(),
                          ]),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
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
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(children: <Widget>[
                            Text("Crop according to deficiency",
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),),
                            Spacer(),
                          ]),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
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
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(children: <Widget>[
                            Text("Crop according to condition",
                              style: new TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),),
                            Spacer(),
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
      ),
    );
  }
  Future<bool> addDialog2(BuildContext context) async {


    return showDialog(

        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Center(child: Text("Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),

            content: Container(
                child:SingleChildScrollView(
                  child:Column(

                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: <Widget>[
                            Text("Wheat"),
                            Spacer(),
                            Text("50%")
                          ],
                        ),

                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: <Widget>[
                            Text("Rye"),
                            Spacer(),
                            Text("65%")
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: <Widget>[
                            Text("Rice"),
                            Spacer(),
                            Text("80%")
                          ],
                        ),

                      ),
                    ],
                  ),
                )

            ),
          );
        }
    );
  }
}

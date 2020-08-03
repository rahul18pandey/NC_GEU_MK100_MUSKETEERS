import 'package:flutter/material.dart';

import 'package:kisan_app/app_localizations.dart';

class CheckDailyPrice extends StatefulWidget {
  @override
  _CheckDailyPriceState createState() => _CheckDailyPriceState();
}

class _CheckDailyPriceState extends State<CheckDailyPrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: (Text(
                AppLocalizations.of(context).translate('first_string'),
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
              ))),
          brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: Color(0xFF637BFF),
        ),
        body:ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            Center(
              child: Container(
                  child:Text("Reccommended Base Price For Auction",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow( children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                      child: Column(children:[
                        Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        Text('Crops',style: TextStyle(fontSize: 20),)
                      ]),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                      child: Column(children:[
                        Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        Text('Minimum',style: TextStyle(fontSize: 20),)
                      ]),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                      child: Column(children:[
                        Padding(
                          padding: EdgeInsets.all(5),
                        ),
                        Text('Maximum',style: TextStyle(fontSize: 20),)
                      ]),
                    ),
                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Paddy : Common',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('1750',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),

                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('2012.5',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Paddy : Grade -"A"',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('1770',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),

                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('2035.5',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),

                    ]),

                  ]),

                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Jowar : Hybrid',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('2430',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),

                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('2794.5',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),

                    ]),

                  ]),

                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Jowar : Maldani',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('2450',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('2817.5',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Bajra',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('1950',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('2242.5',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Maize',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('1700',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('1955',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Ragi',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('2897',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('3331.55',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Arhar(Tur)',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5675',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('6526.25',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Moong',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('9675',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('8021.25',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Urad',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5600',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('6440',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Cotton : Medium & Staple',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5150',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5922.5',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Cotton: Long Staple',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5450',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('6267.5',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Groundnut in Shell',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('4890',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5623.5',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Sunflower Seed',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5388',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('6196.2',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Soyabeen',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('3399',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('3908.85',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Wheat',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('1840',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('2116',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Barley',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('1440',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('1656',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Gram',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('4620',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5313',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Masur(Lentil)',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('4475',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5146.25',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Rapeseed/Mustard',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('4200',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('4830',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Safflower',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('4945',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('5686.75',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Copra : Milling',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('7511',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('8637.65',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),
                  TableRow( children: [
                    Column(children:[
                      Padding(
                        padding: EdgeInsets.all(8),
                      ),
                      Text('Copra : Ball',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('7750',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,))
                      ]),
                    ]),
                    Column(children:[

                      Column(children:[
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text('8912.5',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold))
                      ]),

                    ]),

                  ]),


                ],
              ),
            ),
          ],
        )

    );
  }
}
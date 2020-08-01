import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
      appBar: AppBar(title: Center(child: new Text("Government Schemes",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600))),
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
                            Text("PM-Kisan Scheme",
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
                                child: Text("Pradhan Mantri Kisan Samman Nidhi Yojana is an initiative of the Government wherein 120 million small and marginal farmers of India with less than two hectares of landholding will get up to Rs. 6,000 per year as a minimum income support. PM-Kisan scheme has become operational since 1st December 2018. Under this scheme, cultivators will get Rs. 6000 in three installments.",
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
                            Text("Pradhan Mantri Kisan Maandhan yojana",
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
                                child: Text("Prime Minister Narendra Modi launched a pension scheme for the small & marginal farmers of India last September. Under this pension scheme about 5 crore marginalised farmers will get a minimum pension of Rs 3000 / month on attaining the age of 60. Those who fall in the age group of 18 - 40 years will be eligible to apply for the scheme. Under this scheme, the farmers will be required to make a monthly contribution of Rs 55 to 200, depending on their age of entry, in the Pension Fund till they reach the retirement date, 60 years. The Government will make an equal contribution of the same amount in the pension fund for the cultivators.",
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

                            Expanded(
                              flex: 30,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text("Pradhan Mantri Fasal Bima Yojana (PMFBY)",
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
                                child: Text("Pradhan Mantri Fasal Bima Yojana is an actuarial premium based scheme where farmer has to pay maximum premium of 2 percent for Kharif, 1.5 percent for Rabi food & oilseed crops and 5 percent for annual commercial or horticultural crops and the remaining part of the actuarial or bidded premium is equally shared by the Central & State Government.  An important purpose of the scheme is to facilitate quick claims settlement. The claims should be settled within 2 months of harvest subject to timely provision of both yield data & share of premium subsidy by State Government.",
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
                            Text("Soil Health Card Scheme",
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
                                child: Text("Soil health card scheme was launched in the year 2015 in order to help the State Governments to issue Soil Health Cards to farmers of India.  The Soil Health Cards gives information to farmers on nutrient status of their soil along with recommendations on appropriate dosage of nutrients to be applied for improving soil health and its fertility.",
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
                            Text("Soil Health Card Scheme",
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
                                child: Text("Soil health card scheme was launched in the year 2015 in order to help the State Governments to issue Soil Health Cards to farmers of India.  The Soil Health Cards gives information to farmers on nutrient status of their soil along with recommendations on appropriate dosage of nutrients to be applied for improving soil health and its fertility.",
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
                            Text("Paramparagat Krishi Vikas Yojana (PKVY)",
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
                                child: Text("Paramparagat Krishi Vikas Yojana is implemented with the aim to promote organic cultivation in India. To improve soil health as well as organic matter content and to boost the net income of the farmer so as to realize premium prices.  Under Paramparagat Krishi Vikas Yojana, an area of 5 lakh acre is targeted to be covered though 10,000 clusters of 50 acre each, from 2015-16 to 2017-18.",
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
                      Text("Paramparagat Krishi Vikas Yojana (PKVY)",
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
                        child: Text("Paramparagat Krishi Vikas Yojana is implemented with the aim to promote organic cultivation in India. To improve soil health as well as organic matter content and to boost the net income of the farmer so as to realize premium prices.  Under Paramparagat Krishi Vikas Yojana, an area of 5 lakh acre is targeted to be covered though 10,000 clusters of 50 acre each, from 2015-16 to 2017-18.",
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

    ],
          ),
        ),
      )
    );
  }
}

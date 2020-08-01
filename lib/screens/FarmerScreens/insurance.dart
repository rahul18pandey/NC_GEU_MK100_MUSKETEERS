import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Insurance extends StatefulWidget {
  @override
  _InsuranceState createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {

  String URL="https://www.pmyojana.in/pradhan-mantri-fasal-bima-yojana-2020/";
  String URL1="https://www.cholainsurance.com/pradhan-mantri-fby.html";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: new Text("Insurance Schemes",textAlign: TextAlign.center,)),
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xFF637BFF),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(Icons.settings_voice),
          backgroundColor: Colors.green,
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
                      borderRadius: BorderRadius.circular(12),
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
                                  child: Text("Pradhan Mantri Fasal Bima Yojana (PMFBY)",
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
                                  child: Text("The PMFBY was launched in 2016 and replaces all the prevailing yield insurance schemes in India. The scheme has been launched with an aim to give an impetus to the rural sector. The scheme has extended coverage under localized risks, post-harvest losses etc. and aims at adoption of technology for the purpose of yield estimation. Through increased farmer awareness and low farmer premium rates the scheme aims at increasing the crop insurance penetration in India.",
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
                                child: Text("Know More",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white)),),


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
                      borderRadius: BorderRadius.circular(12),
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
                                child: Text("Bangla Shashya Bima Yojana West Bengal",
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
                                  child: Text("This BSB crop insurance scheme will enable farmers to cover up their losses in case their crops gets damaged due to any reason. The state govt. wants to raise the annual income of the farmers and to enable them to lead a life of dignity and honour. Farmers plays a very important role in the GDP of the state as well of the entire country. So, the state govt. is focusing on raising their living standards which will ensure higher GDP in the coming years. Furthermore, West Bengal govt. wants to reduce the suicide rate of farmers which occurs when farmers suffers from losses in agriculture. West Bengal Bangla Shashya Scheme will also prevent farmers from falling into debt trap.",
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
                                child: Text("Know More",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.white)),),


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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'bidderlist.dart';
import 'buycropPage.dart';
import 'package:kisan_app/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kisan_app/constants.dart';
import 'biddingpage.dart';
import 'package:date_format/date_format.dart';
import 'Payment.dart';
class BiddingPage extends StatefulWidget {
  @override
  _BiddingPageState createState() => _BiddingPageState();
}

class _BiddingPageState extends State<BiddingPage> {
  emailvalafunction e = new emailvalafunction();
  crudMethods fobj = new crudMethods();
  FirebaseUser user;
  String farmeremail;
  String buyeremail;
  String bid;
  QuerySnapshot cropdata1;
  QuerySnapshot farmerdata1;
  QuerySnapshot biddingdata;

  int number;
  QuerySnapshot transactiondata;
  double rating=0.0;
  String date2=formatDate(DateTime.now(), [dd,'/',mm,'/',yy]);

  @override
  void initState() {
    user = fobj.getUser();
    buyeremail = user.email;
    number=e.getNumber();
    fobj.getCropData().then((results) {
      setState(() {
        cropdata1 = results;
      });
    });
    fobj.gettransaction().then((results) {
      setState(() {
        transactiondata = results;
      });
    });
    fobj.getbiddingdata().then((results) {
      setState(() {
        biddingdata = results;
      });
    });
    fobj.getCropData().then((results) {
      setState(() {
        cropdata1 = results;
      });
    });

  }
  double width,height;
  @override
  Widget build(BuildContext context) {
     width = MediaQuery. of(context). size. width;
     height = MediaQuery. of(context). size. height;
    farmeremail = e.getEmail();
    if(transactiondata!=null &&biddingdata!=null && cropdata1!=null){
      int count=0;
      rating=0;
      for(int i=0;i<transactiondata.documents.length;i++){
        if(transactiondata.documents[i].data['Farmer_email']==farmeremail){
          if(transactiondata.documents[i].data['Farmer_Rating']!=""){
            count=count+1;
            rating=(rating+int.parse(transactiondata.documents[i].data['Farmer_Rating']));
          }
        }
      }
      rating=rating/count;

    }



    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle:true,
        title: Text('Saksham Kisan', textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
        backgroundColor: Color(0xFF637BFF),
        elevation: 0,
      ),
      body: _showFarmerProfile(),
    );
  }

  _showFarmerProfile() {




String date4;
int count1=0,q,w;
    if (biddingdata!=null && cropdata1!=null) {

      String date=cropdata1.documents[number].data['Auction_date'];

      for(int i=0;i<date.length;i++)
      {
        if(date[i]=='/' || date[i]=='-'){
          break;
        }
        else{
          date4="${date.substring(0,i+1)}";
        }
      }
      for(int i=0;i<date.length;i++)
      {

        if(date[i]=='/' || date[i]=='-'){
          count1++;
          if(count1==1)
            q=i+1;
          else if(count1==2) {
            w = i;
            break;
          }

        }
      }

      String month="${date.substring(q,w)}";
     //String date4="${date.substring(0,2)}";
      String date5="${date2.substring(0,2)}";
      String month4="${date2.substring(3,5)}";
      int month5=int.parse(month4);
      int month2=int.parse(month);
      month2=month2-month5;

      int intdate5=int.parse(date5);
      int intdate4=int.parse(date4);
      intdate4=intdate4-intdate5;

      if(intdate4>0 && month2>=0) {
        return new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 25.0,top: 8),
                        child: new Text('Crop Information',
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w800,fontFamily: 'Montserrat')),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    'Type : ',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  new Text(
                                    cropdata1.documents[number]
                                        .data['Type'],
                                    style: TextStyle(
                                      fontSize: 17.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    'Price : ',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    cropdata1.documents[number]
                                        .data['Base_price'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                  new Text(
                                    'Farmer Phone Number : ',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  new Text(
                                    cropdata1.documents[number]
                                        .data['Phone'].toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                  new Text(
                                    'Quantity(in Kg) : ',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  new Text(
                                    cropdata1.documents[number]
                                        .data['Quantity'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600
                                    ),
                                  )


                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                  new Text(
                                    'Last Date To Place Bid : ',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  new Text(
                                    cropdata1.documents[number]
                                        .data['Auction_date'].toString(),
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600
                                    ),
                                  )


                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                  new Text(
                                    'Crop View Date : ',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  new Text(
                                    cropdata1.documents[number]
                                        .data['View_date'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                'Farmer Rating  : ',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600),
                              ),
                              new Text(
                                "${rating}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                  new Text(
                                    'Current Bid :  ',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  new Text(
                                    cropdata1.documents[number]
                                        .data['Current_bid'].toString(),
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                  new Text(
                                    'Time Left :  ',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  new Text(
                                    " ${month2.toString()} month ${intdate4.toString()} days",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 35.0, right: 35.0, top: 35.0),
                      ),

                      new SizedBox(

                        width: 130.0,
                        height: 60.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              side: BorderSide(color: Colors.grey)
                          ),
                          color: Colors.green,
                          child: Text('Place Bid', style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0),),
                          onPressed: () {
                            _bidDialog(context,number);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 35.0, right: 35.0, top: 35.0),
                      ),
                      new SizedBox(
                        //width: 180.0,
                        height: 60.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0),
                              side: BorderSide(color: Colors.grey)
                          ),
                          color: Colors.blue,
                          child: Text('Show Your bids', style: TextStyle(fontFamily:'Montserrat',fontWeight: FontWeight.bold,color:Colors.white,fontSize: 17.0),),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => BidderList()));
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),

      );
      }else {
        print("number is ${number}");
        for (int i = 0; i < biddingdata.documents.length; i++) {
          if (farmeremail == biddingdata.documents[i].data['Farmer_email'] &&
              biddingdata.documents[i].data['Crop_type'] ==
                  cropdata1.documents[number].data['Type']) {
            if (buyeremail ==
                biddingdata.documents[i].data['Buyer_email']) {
              print(buyeremail);
              print(biddingdata.documents[i].data['Buyer_email']);
              print(i);
              return Center(
                child: new Container(
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: height/4,bottom: 20),
                          child: new Text(
                              "Auction has ended",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: new Text(
                              'Winner Email is: ${biddingdata.documents[i]
                                  .data['Buyer_email']}',
                              style: TextStyle(

                                  fontSize: 20.0,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: new Text('Crop Price: ${biddingdata.documents[i]
                              .data['Current_bid']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 35.0, right: 35.0, top: 35.0),
                        ),
                        new SizedBox(
                          width: 180.0,
                          height: 60.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(28.0),
                                side: BorderSide(color: Colors.red)
                            ),

                            child: Text('Pay', style: TextStyle(
                              fontSize: 15.0,),),
                            textColor: Colors.blue,
                            onPressed: () {
                              //_addtransaction(i);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(
                                "no",farmeremail,cropdata1.documents[number].data['Quantity'],cropdata1.documents[number].data['Type']
                              )));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: new Container(
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: height/4,bottom: 20),
                          child: new Text(
                              "Auction has ended",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black)),
                        ),
                       Flexible(
                            child: new Text(
                                'Winner Email is: ${biddingdata.documents[i]
                                    .data['Buyer_email']} ',
                                style: TextStyle(

                                    fontSize: 20.0,
                                    fontFamily: 'sans-serif-light',
                                    color: Colors.black)),
                          ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child: new Text('Crop Price: ${biddingdata.documents[i]
                              .data['Current_bid']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 35.0, right: 35.0, top: 35.0),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        }
      }
    }
    else {
      return Loading();
    }
  }
   _bidDialog(BuildContext context,int i) {



      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Place Your Bid")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(

                      alignment: Alignment.centerLeft,
                      decoration: kBoxDecorationStyle,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5.0),
                          border: InputBorder.none,
                          hintText: 'Enter your Bid',
                          hintStyle: kHintTextStyle,
                        ),
                       onChanged: (input){
                          this.bid=input;
                       },

                      ),
                    ),
                  ],
                ),
              ),
            ),

            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  check(this.bid,number);

                },

                child: new Text("Confirm"),
                textColor: Colors.blue,)
            ],
          );
        }

    );
  }
  _incorrect(BuildContext context,int i) {



    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Your Bid can not be placed",  style: TextStyle(color: Colors.red,fontSize: 20.0,fontWeight: FontWeight.bold),)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Container(
              margin: EdgeInsets.all(5.0),
              child: SingleChildScrollView(
                child: Text(
                  "Please enter bid greater than the current bid and base price.",
                      style: TextStyle(color: Colors.black,fontSize: 18.0),
                )
              ),
            ),

            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }

    );
  }

  check(String bid,int number){
    int enteredbid=int.parse(bid);
    print(cropdata1.documents[number].data["Current_bid"]);
     int cb=int.parse("${cropdata1.documents[number].data["Current_bid"]}");
     int bp=int.parse(("${cropdata1.documents[number].data["Base_price"]}"));
    if(cb>enteredbid || bp>enteredbid){
      _incorrect(context,number);
    }
    else{
      fobj.addBiddata({
        'Quantity': cropdata1.documents[number].data['Quantity'],
        'Auction_date': cropdata1.documents[number]
            .data['Auction_date'],
        'Address': cropdata1.documents[number].data['Address'],
        'Phone': cropdata1.documents[number].data['Phone'],
        'View_date': cropdata1.documents[number].data['View_date'],
        'Type': cropdata1.documents[number].data['Type'],
        'Base_price': cropdata1.documents[number]
            .data['Base_price'],
        'Email': farmeremail,
        'Current_bid': this.bid,
      }, (cropdata1.documents[number].documentID)).then((result) {})
          .catchError((e) {
        print(e);
      });
      fobj.addbiddingtable({
        'Crop_type': cropdata1.documents[number].data['Type'],
        'Farmer_email': farmeremail,
        'Buyer_email': buyeremail,
        'Current_bid': this.bid,
      },).then((result) {}).catchError((e) {
        print(e);
      });
      fobj.getCropData().then((results) {
        setState(() {
          cropdata1 = results;
        });
      });
    }
  }
}





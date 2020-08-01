import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:upi_pay/upi_pay.dart';

import '../../constants.dart';
import '../../crud.dart';
import 'buycropPage.dart';

class Payment extends StatefulWidget {
  final String isfarmer;
  final String farmeremail;
  final String quantity;
  final String type;
  Payment(this.isfarmer,this.farmeremail,this.quantity,this.type);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String _upiAddrError;
  Future<List<ApplicationMeta>> _appsFuture;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  crudMethods fobj = new crudMethods();
  String amount,upi;
  emailvalafunction e = new emailvalafunction();
  QuerySnapshot cropdata1,buyersdata;
  int number;
  @override
  void initState() {
    super.initState();
    number=e.getNumber();
    fobj.getCropData().then((results) {
      setState(() {
        cropdata1 = results;
      });
    });
    fobj.getData().then((results) {
      setState(() {
        buyersdata = results;
      });
    });
    _appsFuture = UpiPay.getInstalledUpiApplications();
  }
 bool islocal=false;
  @override
  void dispose() {
    super.dispose();
  }
  Future<void> _onTap(ApplicationMeta app) async {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final transactionRef = Random.secure().nextInt(1 << 32).toString();
      print("Starting transaction with id $transactionRef");

      final response = await UpiPay.initiateTransaction(
        amount: this.amount.toString(),
        app: app.upiApplication,
        receiverUpiAddress: this.upi,
        receiverName: 'shobhit',
        transactionRef: transactionRef,
      );

      UpiTransactionResponse id = new UpiTransactionResponse(
          response.toString());

      if (response.status == UpiTransactionStatus.success) {
        if(widget.isfarmer=='no') {
          fobj.addtransactiondata1({
          'Counter':"1",
          'Email': fobj.user.email,
          'Farmer_email':widget.farmeremail,
          'Quantity':widget.quantity,
          'Remain_quantity':widget.quantity ,
          'Type':widget.type,
          'Farmer_Rating':"",
          'Buyer_Rating':"",
          'Service_Rating':"",
        }).then((result) {})
            .catchError((e) {
          print(e);
        });
        }else{
          if(!islocal) {
            fobj.addtransactiondata1({
              'Email': widget.quantity,
              'Farmer_email': fobj.user.email,
              'Type': widget.type,
              'Farmer_Rating': "",
              'Buyer_Rating': "",
              'Service_Rating': "",
            }).then((result) {})
                .catchError((e) {
              print(e);
            });
          }else{
            fobj.addtransactiondata1({
              'Email': fobj.user.email,
              'Farmer_email': widget.quantity,
              'Type': widget.type,
              'Farmer_Rating': "",
              'Buyer_Rating': "",
              'Service_Rating': "",
            }).then((result) {})
                .catchError((e) {
              print(e);
            });
          }
        }
        fobj.deletecrop(cropdata1.documents[number].documentID);
        Navigator.push(context, MaterialPageRoute(builder: (context) => BuyCropPage()));
      }else{
        return _addDialog(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if(cropdata1!=null && buyersdata!=null) {
      for(int k=0;k<buyersdata.documents.length;k++){
        if(buyersdata.documents[k].documentID==fobj.user.email){
          if(buyersdata.documents[k].data['Type']=='local'){
            islocal=true;
            break;
          }
        }
      }
      print(islocal);
      return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle:true,
        title: Text('Saksham Kisan', textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
        backgroundColor: Color(0xFF637BFF),
        elevation: 0,
      ),
      body: SingleChildScrollView(

        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50,),

                Column(
                  children: <Widget>[


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4.0),
                      child: Container(

                        decoration: kBoxDecorationStyle,
                        height: 60,
                        child: TextFormField(
                          validator: validateAmount,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20.0),
                            hintText: 'Enter amount',
                            hintStyle: kHintTextStyle,
                          ),
                          onSaved: (input) => this.amount= input,
                        ),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4.0),
                  child: Container(

                    decoration: kBoxDecorationStyle,
                    height: 60,
                    child: TextFormField(
                      validator: _validateUpiAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20.0),
                        hintText: 'Enter upi address@upi',
                        hintStyle: kHintTextStyle,
                      ),
                      onSaved: (input) => this.upi= input,
                    ),
                  ),
                ),
                    Container(
                      margin: EdgeInsets.only(bottom: 12,top: 20),
                      child: Text(
                        'Pay Using',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    FutureBuilder<List<ApplicationMeta>>(
                      future: _appsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return Container();
                        }

                        return snapshot.data.isNotEmpty
                            ? GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            childAspectRatio: 1.6,
                            physics: NeverScrollableScrollPhysics(),
                            children: snapshot.data
                                .map((it) => Material(
                              key: ObjectKey(it.upiApplication),
                              color: Colors.grey[200],
                              child: InkWell(
                                onTap: () => _onTap(it),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.memory(
                                      it.icon,
                                      width: 64,
                                      height: 64,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      child: Text(
                                        it.upiApplication
                                            .getAppName(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                                .toList())
                            : new Text(
                          "Note: You must have atleast one UPI app",
                          style: new TextStyle(
                              color: Colors.red, fontSize: 20.0),
                        );
                      },
                    ),




              ],
            )
            ]
        ),
      ),
      )
    );
    }else{
      return Loading();
    }
  }
  String _validateUpiAddress(String value) {
    if (value.isEmpty) {
      return 'UPI Address is required.';
    }

    if (!UpiPay.checkIfUpiAddressIsValid(value)) {
      return 'UPI Address is invalid.';
    }

    return null;
  }
  String validateAmount(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length == 0) {

      return 'provide upi address';
    }
    else {

      return null;
    }
  }
}
Future<dynamic> _addDialog(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
          Center(child: Text("Your payment is failed, please try again")),
          content: SingleChildScrollView(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 70),
                  child: Center(
                    child: RaisedButton(
                      color: Colors.pink,
                      child: Text(
                        "ok",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}


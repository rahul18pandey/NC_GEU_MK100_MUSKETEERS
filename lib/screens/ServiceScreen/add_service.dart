import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'package:kisan_app/constants.dart';
import 'package:flutter/services.dart';
import 'package:kisan_app/crud.dart';

class StorageAddService extends StatefulWidget {
  @override
  _StorageAddServiceState createState() => _StorageAddServiceState();
}

class _StorageAddServiceState extends State<StorageAddService> {
QuerySnapshot servicedata1;
  FirebaseUser user;
  String useremail;
  String phone;
  String croptype;
  String charges;
  String space;
  String fertilizertype;
  String irrigationservice;
crudMethods fobj=new crudMethods();
  final TextEditingController _controller = new TextEditingController();
  var items = ['Wheat', 'Oat', 'Rice', 'Maize','Barley','Sorgum','Rye','Millet'];
var items1 = ['Nitrogen fertilizers', 'Phosphate fertilizers', 'Potassium fertilizers', 'Compound fertilizers','Organic fertilizers','NPK fertilizers'];

@override
void initState() {
  fobj.getServiceData().then((results) {
    setState(() {
      servicedata1 = results;
    });
  });
}


  Widget _buildcroptypeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Select type of crop supported in your service',
          style: kLabelStyle,
        ),

        Container(
          child: new Column(
            children: [
              new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new TextField(controller: _controller),
                    ),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),

                      onSelected: (String value) {

                        _controller.text = value;
                        this.croptype=value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items.map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(child: new Text(value), value: value,);
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
Widget _buildfertilizertypeTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Select Type Of Fertilizer/Pesticides',
        style: kLabelStyle,
      ),

      Container(
        child: new Column(
          children: [
            new Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new TextField(controller: _controller),
                  ),
                  new PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),

                    onSelected: (String value) {

                      _controller.text = value;
                      this.fertilizertype=value;
                    },
                    itemBuilder: (BuildContext context) {
                      return items1.map<PopupMenuItem<String>>((String value) {
                        return new PopupMenuItem(child: new Text(value), value: value,);
                      }).toList();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
  Widget _buildphoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter Phone Number',
          style: kLabelStyle,
        ),

        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.phone,
            onChanged: (value){
              this.phone=value;
            },
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),


            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildspaceTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter Quantity Of The Crop You Can Store/Pack(In Kg)',
          style: kLabelStyle,
        ),

        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value){
              this.space=value;
            },
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),


            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),
            ),
          ),
        ),
      ],
    );
  }
Widget _buildspace1TF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Enter Quantity Of The Crop You Can Transport(In Kg)',
        style: kLabelStyle,
      ),

      SizedBox(height: 5.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value){
            this.space=value;
          },
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),


          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 4.0),
          ),
        ),
      ),
    ],
  );
}
  Widget _buildchargesTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter Charges(Per Kg For Package/Storage)',
          style: kLabelStyle,
        ),

        SizedBox(height: 5.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value){
              this.charges=value;
            },
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),


            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 4.0),
            ),
          ),
        ),
      ],
    );
  }
Widget _buildpriceTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Enter Price(Per Kg)',
        style: kLabelStyle,
      ),

      SizedBox(height: 5.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value){
            this.charges=value;
          },
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),


          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 4.0),
          ),
        ),
      ),
    ],
  );
}
Widget _buildprice1TF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Enter Price(Per Kg/Unit)',
        style: kLabelStyle,
      ),

      SizedBox(height: 5.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value){
            this.charges=value;
          },
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),


          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 4.0),
          ),
        ),
      ),
    ],
  );
}
Widget _buildIrrigationTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Enter Type Of Service',
        style: kLabelStyle,
      ),

      SizedBox(height: 5.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.text,
          onChanged: (value){
            this.irrigationservice=value;
          },
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),


          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 4.0),
          ),
        ),
      ),
    ],
  );
}
Widget _buildtransportchargesTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Enter Charges(100kg/km)',
        style: kLabelStyle,
      ),

      SizedBox(height: 5.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value){
            this.charges=value;
          },
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),


          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 4.0),
          ),
        ),
      ),
    ],
  );
}
Widget _buildsubmit1Btn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        user= fobj.getUser();
        Navigator.of(context).pop();
        fobj.addstorageservicedata({
          'Service_type': this.fertilizertype,
          'Phone':this.phone,
          'Price':this.charges,
          'Email':user.email,
          'Type':'fertilizer/pesticides',
        }).then((result) {
          dialogTrigger(context);
        }).catchError((e) {
          print(e);
        });
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.blue,
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}
  Widget _buildsubmitBtn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        user= fobj.getUser();
        Navigator.of(context).pop();
        fobj.addstorageservicedata({
          'Service_type': this.croptype,
          'Phone':this.phone,
          'Space':this.space,
          'Charges':this.charges,
          'Email':user.email,
          'Type':'coldstorage/warehouse',
        }).then((result) {
          dialogTrigger(context);
        }).catchError((e) {
          print(e);
        });
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.blue,
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}
Widget _buildsubmit4Btn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        user= fobj.getUser();
        Navigator.of(context).pop();
        fobj.addstorageservicedata({
          'Service_type': this.croptype,
          'Phone':this.phone,
          'Space':this.space,
          'Charges':this.charges,
          'Email':user.email,
          'Type':'transport',
        }).then((result) {
          dialogTrigger(context);
        }).catchError((e) {
          print(e);
        });
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.blue,
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}
Widget _buildsubmit5Btn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        user= fobj.getUser();
        Navigator.of(context).pop();
        fobj.addstorageservicedata({
          'Service_type': this.croptype,
          'Phone':this.phone,
          'Space':this.space,
          'Charges':this.charges,
          'Email':user.email,
          'Type':'packaging',
        }).then((result) {
          dialogTrigger(context);
        }).catchError((e) {
          print(e);
        });
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.blue,
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}
Widget _buildsubmit2Btn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5.0,
      onPressed: (){
        user= fobj.getUser();
        Navigator.of(context).pop();
        fobj.addstorageservicedata({
          'Service_type': this.irrigationservice,
          'Phone':this.phone,
          'Charges':this.charges,
          'Email':user.email,
          'Type':'irrigation'
        }).then((result) {
          dialogTrigger(context);
        }).catchError((e) {
          print(e);
        });
      },
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.blue,
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}
  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Service added Successfully', style: TextStyle(fontSize: 15.0)),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
  if(servicedata1!=null) {
    user=fobj.getUser();
    useremail=user.email;
    for(int i=0;i<servicedata1.documents.length;i++) {
      if(useremail==servicedata1.documents[i].documentID && 'wareHouse/coldStorage'==servicedata1.documents[i].data['Type'] ) {
        return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[

              Container(
                height: double.infinity,
                width: double.infinity,

              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 60.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Add Your Crop',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),


                      SizedBox(height: 30.0),
                      _buildcroptypeTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildchargesTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildspaceTF(),
                      SizedBox(
                        height: 10.0,
                      ),

                      _buildphoneTF(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildsubmitBtn(),
                      SizedBox(
                        height: 10.0,
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
      } else if(useremail==servicedata1.documents[i].documentID && 'packaging'==servicedata1.documents[i].data['Type'] ) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[

                  Container(
                    height: double.infinity,
                    width: double.infinity,

                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 60.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Add Your Crop',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),


                          SizedBox(height: 30.0),
                          _buildcroptypeTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildchargesTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildspaceTF(),
                          SizedBox(
                            height: 10.0,
                          ),

                          _buildphoneTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildsubmit5Btn(),
                          SizedBox(
                            height: 10.0,
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    else  if(useremail==servicedata1.documents[i].documentID && 'transport'==servicedata1.documents[i].data['Type']) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[

                  Container(
                    height: double.infinity,
                    width: double.infinity,

                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 60.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Add Your Crop',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),


                          SizedBox(height: 30.0),
                          _buildcroptypeTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildtransportchargesTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildspace1TF(),
                          SizedBox(
                            height: 10.0,
                          ),

                          _buildphoneTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildsubmit4Btn(),
                          SizedBox(
                            height: 10.0,
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
      else  if(useremail==servicedata1.documents[i].documentID && 'fertilizer'==servicedata1.documents[i].data['Type']) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[

                  Container(
                    height: double.infinity,
                    width: double.infinity,

                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 60.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Add Your Crop',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),


                          SizedBox(height: 30.0),
                          _buildfertilizertypeTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildpriceTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildphoneTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildsubmit1Btn(),
                          SizedBox(
                            height: 10.0,
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }else if (useremail==servicedata1.documents[i].documentID && 'irrigation'==servicedata1.documents[i].data['Type']){
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[

                  Container(
                    height: double.infinity,
                    width: double.infinity,

                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 60.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Add Your Crop',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),


                          SizedBox(height: 30.0),
                          _buildIrrigationTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildprice1TF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildphoneTF(),
                          SizedBox(
                            height: 10.0,
                          ),
                          _buildsubmit2Btn(),
                          SizedBox(
                            height: 10.0,
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    }
  }else{
    return Loading();
  }
  }
}

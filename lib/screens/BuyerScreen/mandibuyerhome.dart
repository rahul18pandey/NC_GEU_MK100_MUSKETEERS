
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/Components/dialog_helper.dart';
import 'package:kisan_app/screens/FarmerScreens/Packaging.dart';
import 'package:kisan_app/screens/FarmerScreens/Transportation.dart';
import 'package:kisan_app/screens/FarmerScreens/Warehouse.dart';
import '../../crud.dart';
import '../../sign_in.dart';
import '../chat_screen.dart';
import 'BuyerCollaboration.dart';
import 'buyerprofilepage.dart';
import 'buycropPage.dart';
import 'UploadBill.dart';
import 'transaction.dart';

class MandiBuyerHome extends StatefulWidget {
  @override
  _MandiBuyerHomeState createState() => _MandiBuyerHomeState();
}

class _MandiBuyerHomeState extends State<MandiBuyerHome> {
  crudMethods fobj = new crudMethods();
  QuerySnapshot chatdata;
  @override
  void initState() {
    fobj.getchat().then((results){
      setState((){
        chatdata=results;
      });
    });
    super.initState();

  }
  int chatcount=0;
  @override
  Widget build(BuildContext context) {
    if(chatdata!=null){
      for(int k=0;k<chatdata.documents.length;k++)
      {
        if(chatdata.documents[k].data['reciever']==fobj.user.email){
          if(!chatdata.documents[k].data['isseen']){
            chatcount++;
          }
        }
      }}
    return new WillPopScope(
        onWillPop: () async {
      return await DialogHelper.exit(context);
    },
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF637BFF),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: new Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  new Icon(Icons.message),
                  new Positioned(
                      top: -1.0,
                      right: -6.0,
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(4.0), color: Colors.red),
                        width: 16.0,
                        child: Center(
                          child: new Text(
                            "${chatcount}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ))
                ]
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ChatScreen()));
            },
          )

        ],
      ),
      body: SingleChildScrollView(
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
              colors: [Color(0xFF637BFF),Color(0XFF21C8F6)],
            ),
          ),
          child: Container(
            padding:EdgeInsets.only(top:25.0),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('images/2282.jpg'),
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Text(
                    "Select Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Pacifico",
                      fontSize: 35.0,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/buyer.png'),width: 36,height: 36,),
                      title: Text(
                        "Buy Crops",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontFamily: "Source Sans Pro"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>BuyCropPage()));
                  },
                ),
                FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/upload.png'),width: 36,height: 36,),
                      title: Text(
                        "Upload Bills",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontFamily: "Source Sans Pro"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadBill()));
                  },
                ),
                FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/recent.png'),width: 36,height: 36,),
                      title: Text(
                        "Recent Transactions",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontFamily: "Source Sans Pro"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionPage()));
                  },
                ),
                FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/collab.png'),width: 36,height: 36,),
                      title: Text(
                        "Collaboration",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontFamily: "Source Sans Pro"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyerCollaboration()));
                  },
                ),
                FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(image: AssetImage('images/user.png'),width: 36,height: 36,),
                      title: Text(
                        "My Profile",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20.0,
                            fontFamily: "Source Sans Pro"),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BuyerProfilePage()));
                  },
                ),
                FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(
                          image: AssetImage(
                            'images/package.png',
                          )),
                      title: Text(
                        "Packaging",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0,
                          fontFamily: "Source Sans Pro",
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Packaging()),
                    );
                  },
                ),
                FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(
                          image: AssetImage(
                            'images/test3.png',
                          )),
                      title: Text(
                        "Transport",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0,
                          fontFamily: "Source Sans Pro",
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Transportation()),
                    );
                  },
                ),
                FlatButton(
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: Image(
                          image: AssetImage(
                            'images/warehouse.png',
                          )),
                      title: Text(
                        "WareHouse",
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0,
                          fontFamily: "Source Sans Pro",
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WareHouse()),
                    );
                  },
                ),
                SizedBox(height: 90,),
              ],
            ),
          ),
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            InkWell(
              splashColor: Colors.teal,
              onTap: () {
                setState(() {});
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(fontFamily: 'Montserrat',fontSize: 15,fontWeight: FontWeight.bold),
                ),
                leading: Image(image: AssetImage('images/home.png'),width: 36,height: 36,),
              ),
            ),
            Divider(),
            InkWell(
              splashColor: Colors.teal,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BuyCropPage()));
              },
              child: ListTile(
                title: Text(
                  'Buy Crop',
                  style: TextStyle(fontFamily: 'Montserrat',fontSize: 15,fontWeight: FontWeight.bold),
                ),
                leading:Image(image: AssetImage('images/buyer.png'),width: 36,height: 36,),
              ),
            ),
            Divider(),
            InkWell(
              splashColor: Colors.teal,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>UploadBill()));
              },
              child: ListTile(
                title: Text(
                  'Upload Bills',
                  style: TextStyle(fontFamily: 'Montserrat',fontSize: 15,fontWeight: FontWeight.bold),
                ),
                leading: Image(image: AssetImage('images/upload.png'),width: 36,height: 36,),
              ),
            ),
            Divider(),
            InkWell(
              splashColor: Colors.teal,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BuyerProfilePage()));
              },
              child: ListTile(
                title: Text(
                  'My profile',
                  style: TextStyle(fontFamily: 'Montserrat',fontSize: 15,fontWeight: FontWeight.bold),
                ),
                leading: Image(image: AssetImage('images/user.png'),width: 36,height: 36,),
              ),
            ),
            Divider(),
            InkWell(
              splashColor: Colors.teal,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: ListTile(
                title: Text(
                  'Log out',
                  style: TextStyle(fontFamily: 'Montserrat',fontSize: 15,fontWeight: FontWeight.bold),
                ),
                leading: Image(image: AssetImage('images/logout.png'),width: 36,height: 36,),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}

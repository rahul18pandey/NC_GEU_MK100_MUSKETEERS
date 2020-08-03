import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kisan_app/Constants/loading.dart';
import 'dart:io';
import 'package:kisan_app/crud.dart';
import 'package:kisan_app/constants.dart';
import 'package:kisan_app/screens/BuyerScreen/UploadBill.dart';
import '../../app_localizations.dart';
class AddBill extends StatefulWidget {
  @override
  _AddBillState createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  crudMethods fobj=new crudMethods();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();
  FirebaseUser user;
  String filename;
  String quantity;
  File _imageFile;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  QuerySnapshot transactiondata;
  Future getImage() async {
    File image;
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = image;
    });
  }

  @override
  void initState() {
    user=fobj.getUser();
    fobj.getTransaction().then((results){
      setState(() {
        transactiondata=results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(transactiondata!=null) {
      return Scaffold(
      appBar: AppBar(title: new Text("Upload Bill"),
        automaticallyImplyLeading: false,
      ),
      body:SingleChildScrollView(
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: (_imageFile==null) ?Text(""):enableUpload(),
                ),
              ],

            ),
          ),
        ),



      ),
      floatingActionButton: new FloatingActionButton(onPressed: getImage,tooltip: 'Add Bill',child: new Icon(Icons.photo_camera),),
    );
    }else{
      return Loading();
    }
  }
  Future<dynamic>showerror(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Pick Image/File",style: TextStyle(fontFamily: 'BeVietnam',),)),
            content: SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left:70),
                    child: Center(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text("ok",style: TextStyle(fontSize: 20,fontFamily: 'BeVietnam',),),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );

        }


    );
  }

  Widget enableUpload(){
    var items = [(AppLocalizations.of(context).translate('57')), (AppLocalizations.of(context).translate('58')), (AppLocalizations.of(context).translate('59')),(AppLocalizations.of(context).translate('60')),(AppLocalizations.of(context).translate('61')),(AppLocalizations.of(context).translate('62')),(AppLocalizations.of(context).translate('63')),(AppLocalizations.of(context).translate('64')),(AppLocalizations.of(context).translate('155')),(AppLocalizations.of(context).translate('156')),(AppLocalizations.of(context).translate('157')),];
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[

            Container(
              margin: EdgeInsets.all(20.0),
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
                            this.filename=value;
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
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              margin: EdgeInsets.all(20.0),
              height: 60,
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide Quantity';
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14.0),
                  hintText: 'Enter Quantity for Bill',
                  hintStyle: kHintTextStyle,
                ),
                onSaved: (input) => this.quantity = input,
              ),
            ),

            Image.file(_imageFile,height: 300.0,width: 300.0,),
            RaisedButton(
              elevation: 7.0,
              child: Text("Upload"),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () async{
                     if(_formKey.currentState.validate() &&_controller.text.length!=0) {
                    _formKey.currentState.save();
                    showLoadingDialog(context, _keyLoader);
                        final StorageReference firebaseStorgaeRef = FirebaseStorage
                      .instance.ref().child(user.email + "/" + this.filename+this.quantity);
                               final StorageUploadTask task = firebaseStorgaeRef.putFile(_imageFile);
                              StorageTaskSnapshot taskSnapshot = await task.onComplete;
                              String url = await taskSnapshot.ref.getDownloadURL();
                                  await Firestore.instance.collection('Bill').add({
                                'Email': user.email,
                                 'URL': url,
                             'Type': filename,
                                    'Bill_Quantity':quantity
                               });
                         }
                     setcounter();
                     Navigator.of(
                         _keyLoader.currentContext,
                         rootNavigator: true).pop();
                     showuploadDialog(context);
                           _imageFile=null;
                           filename=null;
                           quantity=null;
                     (context as Element).reassemble();
                     },
            )
          ],
        ),
      ),
    );
  }
  Future<dynamic>showuploadDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text("Document Uploaded",style: TextStyle(fontFamily: 'BeVietnam',),)),
            content: SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left:70),
                    child: Center(
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text("ok",style: TextStyle(fontSize: 20,fontFamily: 'BeVietnam',),),
                        onPressed: (){
                         Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );

        }


    );
  }
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait Uploading....",style: TextStyle(color: Colors.blueAccent,fontFamily: 'BeVietnam',),)
                      ]),
                    )
                  ]));
        });
  }
  setcounter(){
    for(int i=0;i<transactiondata.documents.length;i++){

      if(transactiondata.documents[i].data['Email']==user.email && transactiondata.documents[i].data['Type']==filename){
        print(transactiondata.documents[i].data['Remain_quantity']);
         int quantity1=(int.parse(transactiondata.documents[i].data['Remain_quantity']))-int.parse(quantity) ;
         if(quantity1==0) {
           fobj.addtransactiondata({
          'Counter':"0",
          'Email': transactiondata.documents[i].data['Email'],
          'Farmer_email':transactiondata.documents[i].data['Farmer_email'],
          'Quantity':transactiondata.documents[i].data['Quantity'],
             'Remain_quantity': quantity1.toString(),
          'Type':transactiondata.documents[i].data['Type'],
             'Buyer_Rating':transactiondata.documents[i].data['Buyer_Rating'],
             'Service_Rating':transactiondata.documents[i].data['Service_Rating'],
             'Farmer_Rating':transactiondata.documents[i].data['Farmer_Rating']
        }, (transactiondata.documents[i].documentID)).then((result) {})
            .catchError((e) {
          print(e);
        });
         }else{
           fobj.addtransactiondata({
             'Counter':"1",
             'Buyer_Rating':transactiondata.documents[i].data['Buyer_Rating'],
             'Service_Rating':transactiondata.documents[i].data['Service_Rating'],
             'Farmer_Rating':transactiondata.documents[i].data['Farmer_Rating'],
             'Email': transactiondata.documents[i].data['Email'],
             'Farmer_email':transactiondata.documents[i].data['Farmer_email'],
             'Quantity':transactiondata.documents[i].data['Quantity'],
             'Remain_quantity': quantity1.toString(),
             'Type':transactiondata.documents[i].data['Type'],
           }, (transactiondata.documents[i].documentID)).then((result) {})
               .catchError((e) {
             print(e);
           });
         }
      }
    }
  }
}


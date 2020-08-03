import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'sign_in.dart';





final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
userinfo c=new userinfo();
class crudMethods{


  FirebaseUser user;
  crudMethods(){
    user=c.getUserEmail();
  }


  bool isLoggedIn(){
    if(FirebaseAuth.instance.currentUser()!=null){
      return true;
    }else{
      return false;
    }
  }
  Future<void>addData(userData)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Farmer').document(user.email).setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addcropdata(userData)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Farmer_Crop').document().setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addBiddata(userData,documentID)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Farmer_Crop').document(documentID).setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addtransactiondata1(userData)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Transaction').document().setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addtransactiondata(userData,documentID)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Transaction').document(documentID).setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addbiddingtable(userData)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Bidding').document().setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addstorageservicedata(userData)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Added_Service').document().setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addRating(userData,documentID)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Transaction').document(documentID).setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  getData() async {
    return await Firestore.instance.collection('Buyer').getDocuments();
  }
  getFarmerData() async {
    return await Firestore.instance.collection('Farmer').getDocuments();
  }
  getServiceData() async {
    return await Firestore.instance.collection('Service').getDocuments();
  }
  getCropData() async{
    return await Firestore.instance.collection('Farmer_Crop').getDocuments();
  }
  getCropLocalData() async{
    return await Firestore.instance.collection('Farmer_Crop').orderBy("Quantity",descending: false).getDocuments();
  }
  getAddedServiceData() async{
    return await Firestore.instance.collection('Added_Service').getDocuments();
  }
  getTransaction()async{
    return await Firestore.instance.collection('Transaction').getDocuments();
  }
  getUser()
  {
    return user;
  }
  gettransaction() async{
    return await Firestore.instance.collection('Transaction').getDocuments();
  }
  getbiddingdata() async{
    return await Firestore.instance.collection('Bidding').orderBy("Current_bid",descending: true).getDocuments();
  }
  getChat() async{
  return await Firestore.instance.collection('messages').orderBy("date").getDocuments();
}

  getBill() async{
    return await Firestore.instance.collection('Bill').getDocuments();
  }
  Future<void>addchat(userdata)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Chat').document().setData(userdata).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addchatuser(userdata,String recieveremail)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Chat User').document("${user.email}").collection("user").document("${recieveremail}").setData(userdata).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addchatuser1(userdata,String recieveremail)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Chat User').document("${recieveremail}").collection("user").document("${user.email}").setData(userdata).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  getchat() async {
    return await Firestore.instance.collection("Chat").getDocuments();
  }
  getchatuser() async {
    return await Firestore.instance.collection("Chat User").document("${user.email}").collection("user").getDocuments();
  }
  Future<void>deletecrop(String a)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Farmer_Crop').document("${a}").delete().catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addcollaborationrequest(userData)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Collaboration').document().setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  Future<void>addcollaborationrequest1(userData,String a)async{
    if(isLoggedIn()){
      Firestore.instance.collection('Collaboration').document('${a}').setData(userData).catchError((e){
        print(e);
      });
    }else{
      print("you need to login");
    }
  }
  getcollaboration() async {
    return await Firestore.instance.collection("Collaboration").getDocuments();
  }
  getapidata()async{
    return await Firestore.instance.collection("api_data").document('2020').collection('1').orderBy("quantity",descending: true).getDocuments();
  }

}
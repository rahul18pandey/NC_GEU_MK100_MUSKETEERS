import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:kisan_app/screens/FarmerScreens/RetailerPage.dart';

class SelfCollaboration extends StatefulWidget {
  @override
  _SelfCollaborationState createState() => _SelfCollaborationState();
}

class _SelfCollaborationState extends State<SelfCollaboration> {

  String selected=null;
  double width,height;

  @override
  Widget build(BuildContext context) {
     width = MediaQuery.of(context).size.width;
     height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle:true,
        title: Text("Collaboration", textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,color: Colors.white,fontSize: 18),),
        backgroundColor: Color(0xFF637BFF),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15,),
          Container(
            width: 20,
            child: selected==null?
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.red)
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RetailerList()));
              },
              color: Colors.blue,
              child: Text("See Retailer List", style: TextStyle(
                fontFamily: "Montserrat",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0)),):Text("")
          ),
          SizedBox(height: 15,),
          Container(
      child: selected ==null ? takecrop() : cropbuilder()
          )
        ],
      ),
    );
  }
  Widget cropbuilder() {
    if(selected!=null){
      if(selected=='rice'){
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Text("Rice plant",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: width/2),
                child: Text("Step 1: Register a Company",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text("Visit the following website to follow the indian government standards to register a company . It also leads to all the portals for various important registrations .\n\nLink:http://www.mca.gov.in/MinistryV2/incorporation_company.html",style: TextStyle(fontSize: 18,),),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: width/4),
                child: Text("Step2: Udyog Aadhaar MSME Registrations:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text("Micro Small and Medium Enterprises are classified into three different types, which are mentioned below:\n\n ‣ Micro Enterprises – Incase  a business sets 25 lacs rupees in a specific business in the manufacturing sector comes under Micro Enterprises.\n\n ‣ Small Enterprises – Such industries are identify incase the investment is more than 25 lakhs and below 5 crores comes under the manufacturing sector also incase the industry spends more than 10 lakhs and less than 2 crores under the services sector comes under Small Enterprises.\n\n ‣ Medium Enterprises – Such industries has investment more than 5 crores and below 10 crores falls under the manufacturing sector and incase of more than 2 crores and less than 5 crores under trade type services sector comes under Small Enterprises. Learn More",style: TextStyle(fontSize: 18,),),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: width/1.8),
                child: Text("Step 3 - Factory License:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
              margin: EdgeInsets.only(top: 15,right: width/5),
                child: Text("The procedure of registering a factory in India",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text("It is obligatory for every factory in India to abide by the rules and guidelines stated in the Factories Act, 1948. The first step towards establishing a factory in India is the registration of the factory, and once the registration is done, the licenses can be availed from the government. Following is the procedure to be followed for factory registration in India:\n\n ‣ An applicant has to apply with duly filled in Form No-2, a set of prescribed documents and fees prescribed in the proper head of Account in the shape of Treasury Chalan in the office of Director of Factories & Boilers, of his state.\n\n ‣ Upon receiving the application, the same is scrutinized by the concerned officer.\n\n ‣ Post scrutiny, if the documents are found correct, it is processed for approval by the competent Authority.\n\n ‣ After approval is given, a registration certificate and a license duly signed by the Competent Authority are sent by post to the applicant with a covering letter.",style: TextStyle(fontSize: 18,),)),
              Container(
                margin: EdgeInsets.only(top: 15,right: width/5),
                child: Text("Documents Required for Factory Registration",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Following is the list of documents needed for Factory Registration:\n\n ‣ Form No-2 or Combined application form for establishment of industries in form 1AA.\n\n ‣ Construction completion report from management as per the approved plan.\n\n ‣ Requisite Fee in shape of treasury Chalan in proper Head of Account as per fee structure notified in from time to time.\n\n ‣ Resolution of Director/partners nominating one to act as occupier under section 2(n) of Factories Act.\n\n ‣ Original copy of Stability Certificate issued by a recognized competent person.\n\n ‣ Safety & Health Policy for 2(CB) and MAH category factories and other factories are employing 50 or more workers.",style: TextStyle(fontSize: 18,),)
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: width/2.3),
                child: Text("Step 4 - No pollution certificate:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Apply for ‘consent to operate’ and ‘consent to establish’ from the Pollution Control Board Acts 1958: Apply for the Rice-Milling Industry (Regulation) Act, 1958.",style: TextStyle(fontSize: 18,)),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: width/2.7),
                child: Text("Step 5 - PFA and ESIC Registration:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("If your rice mill plant has employees then you need to get PFA and ESIC registration for the employees according to labour law.\n\nLink:-https://www.esic.in/ESICInsurance1/ESICInsurancePortal/Signup.aspx")
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: width/1.8),
                child: Text("Step 6 - FSSAI License:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Rice mill plant is categorized in the food industry; therefore, you need to apply for FSSAI license (Food Safety and Standard Authority of India) one of the necessary condition after registering business entity is to obtain Government License / Permits.\n\nLink:- https://foodlicensing.fssai.gov.in/index.aspx",style: TextStyle(fontSize: 18,),)
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: width/2),
                child: Text("Step 7 - GST Registration:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Link:- https://www.gst.gov.in/                                                   ")
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: width/9,left: 10),
                child: Text("List of “Equipment and Raw Material required” for Rice Mill Plant.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("\n\n ‣ The basic raw substantial for rice mill plant is Paddy (raw form of rice crop), the quality of the rice depends on the rice crop so you have to conscious while selecting raw material.\n\n ‣ The rice is cultivated from the farmer so it is helpful to get raw material directly from a farmer with a reasonable price it will save your money.\n\n ‣ Maintain production all year you have to preserve the raw material supplies, therefore raw material source is really important.\n\n ‣ One need to find the farmer or a person who wants your service of rice mill where they can separate husk and padding and get rice.",style: TextStyle(fontSize: 18,),)
              ),
              Container(
                margin: EdgeInsets.only(top: 10,right: width/1.4),
                child: Text("Machinery",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("According to the size of the rice mill processing plant, there is the different type of machinery available in the market; you need to choose the right machinery for your rice mill plant. The important factor is cone slider while selecting the machinery are production rate, efficiency, capacity, and power equipment; also consider the execution, whether the machine is a single stage or multi-stage.\n\n ‣ Grading machine\n ‣ Grain dryer\n ‣ Lighting equipment\n ‣ Measure and packing machine\n ‣ Paddy husker machine\n ‣ Paddy separator machine\n ‣ Rice cleaning machine\n ‣ Rice color sorter\n ‣ Rice destoner machine\n ‣ Rice milling detection machine\n ‣ Rice polishing machine\n ‣ Rice whitener machine",style: TextStyle(fontSize: 18,),)
              ),
            ],
          ),
        );
      }
    }
    else{
      return Container(
        margin: EdgeInsets.all(10),
        child: Text("Please choose one crop"),
      );
    }
  }
  Widget takecrop(){
    return Column(
      children: <Widget>[
        Container(
    padding: EdgeInsets.all(16),
    child: DropDownFormField(
    titleText: 'Crops',
    hintText: 'Please choose one',
    value: selected,
      onSaved: (value) {
        setState(() {
          selected = value;
        });
      },
      onChanged: (value) {
        setState(() {
          selected = value;
        });
      },
      dataSource: [
        {
          "display": "Rice",
          "value": "rice",
        },
      ],
      textField: 'display',
      valueField: 'value',
    )
        ),
        RaisedButton(
          child: Text("go"),
          onPressed: (){
            (context as Element).reassemble();
          },
        )
      ],
    );
}
}




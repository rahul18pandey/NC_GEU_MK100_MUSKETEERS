import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
class GetGSTVerified extends StatefulWidget {
  @override
  _GetGSTVerifiedState createState() => _GetGSTVerifiedState();
}

class _GetGSTVerifiedState extends State<GetGSTVerified> {

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
        title: Text("GST Registration Steps", textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
        backgroundColor: Color(0xFF637BFF),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
              child: cropbuilder()
          )
        ],
      ),
    );
  }
  Widget cropbuilder() {
    if(true){
      if(true){
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Text("GST Verification Step",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,),
                child: Text("Part I: Generate your GST Application form",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text("The first step is to obtain the Temporary Registration Number (TRN). To obtain this, you need a valid mobile number (an India number), email address and PAN (Permanent Account Number) for the business. \n1. Go to the official GST portal - https://www.gst.gov.in/ and under the services tab, choose Services > Registration > New Registration. \n2. On the Registration page, enter all the requested details (including your PAN number), email address and mobile number. \n3. After entering the details, click proceed. You will receive two different OTPs on your mobile and on your email for verifying the mobile number and the email id. OTP is valid only for 10 minutes. If required, you can regenerate the OTP. Your Temporary Reference number will be generated at the end of this process. \n4. To use this number, either click Proceed or Services > Registration > New Registration option and select the Temporary Reference Number (TRN) radio button to login using the TRN. \n5. In the Temporary Reference Number (TRN) field, enter the TRN generated and enter the captcha text as shown on the screen. \n6. After this you will be asked to verify OTP again. This is different from the previous OTP generated, please enter the new OTP received. The same OTP will be received on the verified mobile number and email id. \n7. This will take you to your “My Saved Application” page. You will have to fill in all the form details and submit within 15 days. After this, your number and saved form will be deleted. Click the Edit button and proceed to Part II."),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,),
                child: Text("Part II: Filling in your GST Application form",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text("The form contains 10 sections / tabs. Please click each tab to enter that section. Please consult your CA/Tax Consultant/GST Practitioner before submitting the form. \nFor this process, you need scanned copies of the following documents and some additional personal information: \n >Valid Bank Account Number and IFSC \n >Proof of constitution / incorporation of business \n \n1. In case of a Partnership Firm – Deed of Partnership \n2. For Others- Registration Certificate of the business entity \n>Proof of primary place of business.\n>Photo of promoter, director, partner, karta of Hindu undivided family (HUF) (whichever is applicable) \n>Proof of appointment of Authorised Signatory. \n>Photo of Authorised Signatory. \n>Front / first page of bank passbook / statement containing bank account number, branch address, address of account holder and latest transaction details \nOnce you have all the above-mentioned documents in place, follow the steps below to start the enrolment process: \n\nSteps to follow . If you are logged out, you can log in again using your TRN number in previous section:\n \n Step 1 – Fill in all the tabs, with instructions as provided in the slides above. Click Save & Continue to ensure you all information you filled in is saved. \nStep 2 – Complete the details in the 'Business' and the 'Promoters / Partners' tabs, with at least the mandatory fields that have been highlighted. Ensure you provide proof of the constitution of business. \nStep 3 - Fill in the 'Authorized Signatory' information. Please note that, in case you wish to e-sign the form, the mobile/email of the Authorized Signatory will be used. If you wish to sign with DSC, the PAN of your Authorized Signatory must be linked to the DSC. \nStep 4 – Further instructions on how to fill the remaining tabs such as 'Primary Place of Business' (PPOB) Tab, 'Goods & Services' Tab, 'Bank Accounts' Tab are mentioned in the above slides."),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,),
                child: Text("Part III: Registering your Digital Signature Certificate",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("In order to verify your GST application, you would need to digitally sign the form. Please note that: \n\n> DSC is compulsory for Companies and LLPs. \n>You can only register and use the digital signature of the Authorized Signatory specified in the registration form. \n>If you wish to verify the form by other available methods (rather than by the use of DSC), please refer to Part IV. \n>If you wish to sign the document using Digital Signature Certificate (DSC), please follow instructions below: Please ensure you have DSC software installed on your computer. \n>If you wish to get a DSC, you can contact any one of the certifying authorities mentioned on https://www.cca.gov.in/cca/. \n>One you get the DSC software installed, you should also have the DSC Dongle with you (which you will receive with the DSC software). \n>To sign the GST form, you need to also install Emsigner. You can download and install the DSC Signer from emsigner.com")),
              Container(
                margin: EdgeInsets.only(top: 10,),
                child: Text("Part IV: Verify and Submit Your GST Application",style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text("You can submit the application by choosing any one of the 3 verification methods: \n\n>Verification with DSC: Please refer to earlier section.\n>Verification with e-signature: Refer to the section below.\n>Verification with EVC: Refer to the section below.\nOn completion, an Application Reference Number (ARN) will be generated and sent to your mobile number and email id. You can use this to track your application status (Services > Registration > Track Application).\n \nOnce your Application Status shows “Approved”, an email and SMS will be received intimating that the GSTIN is generated and providing a temporary user name (which will be your GSTIN number) and password to login to the GST website. \n\n While logging into the GST portal using the temporary username and password received, you will have to go to the 'Login' page and then click on 'First time login' option, which will be available at the bottom of the login page. After you input the temporary username and password provided to you and click on 'Login' option, it will ask you to change the username and password for future use.\n\nYou will be able to Download your Registration Certificate within 3-5 days. To download your Registration Certificate, log in using your valid credentials on the www.gst.gov.in website to access your dashboard, go to Services > User Services > View or Download Certificates and click the Download button.")
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
}
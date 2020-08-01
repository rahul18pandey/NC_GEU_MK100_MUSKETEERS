function profession_selector(user) {
    console.log("user : ", user);
    const selEle = document.getElementById("profession_selector");
    //   for farmer
    if(user == 'farmer'){
    temp = `
    <form class="col s12">
      <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="first_name" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">account_circle</i>
          <input id="last_name" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
      </div>
			      <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">phone</i>
          <input id="phone_number" type="tel" class="validate" >
          <label for="phone_number">Phone Number</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">place</i>
          <input id="address" type="text" class="validate">
          <label for="address">Address</label>
        </div>
      </div>
			   <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">place</i>
          <input id="district" type="text" class="validate" >
          <label for="district">District</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">home</i>
          <input id="house_number" type="text" class="validate">
          <label for="house number">House Number</label>
        </div>
      </div>
			   
			       <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">location_city</i>
          <input id="city" type="text" class="validate" >
          <label for="city">City</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">place</i>
          <input id="state" type="text" class="validate">
          <label for="state">State</label>
        </div>
      </div>
			       <div class="row">
					   <div class="input-field col s6">
			<i class="material-icons prefix">place</i>
          <input id="farm_area" type="text" class="validate">
          <label for="farm area">Farm Area</label>
        </div>
          <div class="input-field col s6">
          <i class="material-icons prefix">create</i>
          <input id="pin_code" type="tel" class="validate" >
          <label for="pin code">PIN Code</label>
        </div>
        
      </div>
			    <div class="row">
					   <div class="input-field col s6">
			<i class="material-icons prefix">person</i>
          <input id="police_station" type="text" class="validate">
          <label for="police station">Police Station</label>
        </div>
          <div class="input-field col s6">
          <i class="material-icons prefix">local_post_office</i>
          <input id="post_office" type="text" class="validate" >
          <label for="post office">Post Office</label>
        </div>
        
      </div>
			   
    
      <div class="row">
        <div class="input-field col s12">
			<i class="material-icons prefix">email</i>
          <input id="aadhar" type="text" class="validate">
          <label for="aadhar">Aadhar Card Number</label>
        </div>
      </div>
			    


<div class="row">
   <div class="col s12 m12 l12 top_marg">
		<a class="waves-effect waves-light btn-small" onclick='signup_farmer()'>save</a>
			   </div>
    
			   </div>
    </form>
    `;
    }
    else if(user == 'bigseller'){
        temp = `
        
<form class="col s12">
<div class="row">
  <div class="input-field col s6">
    <i class="material-icons prefix">account_circle</i>
    <input id="first_name" type="text" class="validate">
    <label for="first_name">First Name</label>
  </div>
  <div class="input-field col s6">
    <i class="material-icons prefix">account_circle</i>
    <input id="last_name" type="text" class="validate">
    <label for="last_name">Last Name</label>
  </div>
</div>
<div class="row">
  <div class="input-field col s6">
    <i class="material-icons prefix">phone</i>
    <input id="phone_number" type="tel" class="validate">
    <label for="phone_number">Phone Number</label>
  </div>
  <div class="input-field col s6">
    <i class="material-icons prefix">create</i>
    <input id="pin_code" type="text" class="validate">
    <label for="pin_code">PIN Code</label>
  </div>
</div>

<div class="row">
  <div class="input-field col s6">
    <i class="material-icons prefix">place</i>
    <input id="state" type="text" class="validate">
    <label for="state">State</label>
  </div>
  <div class="input-field col s6">
    <i class="material-icons prefix">business</i>
    <input id="address" type="text" class="validate">
    <label for="address">Address</label>
  </div>

</div>
<div class="row">
  <div class="input-field col s6">
    <i class="material-icons prefix">business_center</i>
    <input id="gst_number" type="text" class="validate" onBlur="get_gst_fun()">
    <label for="gst_number">GST Number</label>
  </div>
  <div class="input-field col s6">
    <i class="material-icons prefix">business_center</i>
    <input id="license" type="text" class="validate">
    <label for="license">License Number</label>
  </div>

</div>




<div class="row">
  <div class="col s12 m12 l12 top_marg">
    <a class="waves-effect waves-light btn-small disabled" id="savebtn" onclick="signup_bigseller()">save</a>
  </div>

</div>
</form>
        `;

    }
    else if(user == 'mandiseller'){
        temp = `
        <form class="col s12">
      <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="first_name" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">account_circle</i>
          <input id="last_name" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
      </div>
			      <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">phone</i>
          <input id="phone_number" type="text" class="validate" >
          <label for="phone_number">Phone Number</label>
        </div>
					  <div class="input-field col s6">
          <i class="material-icons prefix">create</i>
          <input id="pin_code" type="text" class="validate" >
          <label for="pin_code">PIN Code</label>
        </div>
        
      </div>
			   <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">place</i>
          <input id="district" type="text" class="validate" >
          <label for="district">District</label>
        </div>
      <div class="input-field col s6">
			<i class="material-icons prefix">place</i>
          <input id="address" type="text" class="validate">
          <label for="address">Address</label>
        </div>
      </div>
			   
			       <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">location_city</i>
          <input id="city" type="text" class="validate" >
          <label for="city">City</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">place</i>
          <input id="state" type="text" class="validate">
          <label for="state">State</label>
        </div>
      </div>
			     
			     <div class="row">
           <div class="input-field col s6">
			<i class="material-icons prefix">business_center</i>
          <input id="gst_number" type="text" class="validate" onBlur="get_gst_fun()">
          <label for="gst_number">GST Number</label>
        </div>
					    <div class="input-field col s6">
			<i class="material-icons prefix">business_center</i>
          <input id="license" type="text" class="validate">
          <label for="license">License Number</label>
        </div>
			   </div>
    
      <div class="row">
        <div class="input-field col s12">
			<i class="material-icons prefix">note</i>
          <input id="aadhar" type="text" class="validate">
          <label for="aadhar">Aadhar Card Number</label>
        </div>
      </div>
			    


<div class="row">
   <div class="col s12 m12 l12 top_marg">
		<a class="waves-effect waves-light btn-small" id="savebtn" onclick="signup_mandiseller()">save</a>
			   </div>
       
			   </div>
    </form>
        
        `;

    }
    else if(user == 'localseller'){
        temp = `
        <form class="col s12">
      <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="first_name" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">account_circle</i>
          <input id="last_name" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
      </div>
			      <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">phone</i>
          <input id="phone_number" type="tel" class="validate" >
          <label for="phone_number">Phone Number</label>
        </div>
					   <div class="input-field col s6">
          <i class="material-icons prefix">create</i>
          <input id="pin_code" type="text" class="validate" >
          <label for="pin_code">PIN Code</label>
        </div>
        
      </div>
			   <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">place</i>
          <input id="address" type="tel" class="validate" >
          <label for="address">Address</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">place</i>
          <input id="district" type="text" class="validate">
          <label for="district">District</label>
        </div>
      </div>
			   
			       <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">location_city</i>
          <input id="city" type="tel" class="validate" >
          <label for="city">City</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">place</i>
          <input id="state" type="text" class="validate">
          <label for="state">State</label>
        </div>
      </div>
			      
			
			   
    
      <div class="row">
        <div class="input-field col s12">
			<i class="material-icons prefix">note</i>
          <input id="aadhar_number" type="text" class="validate">
          <label for="aadhar_number">Aadhar Card Number</label>
        </div>
      </div>
			    


<div class="row">
   <div class="col s12 m12 l12 top_marg">
		<a class="waves-effect waves-light btn-small" onclick="signup_localseller()">save</a>
			   </div>
			   </div>
    </form>
        `;
    }
    else if(user == 'serviceprovider'){
        temp = `
        <form class="col s12">
      <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="first_name" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">account_circle</i>
          <input id="last_name" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
      </div>
			      <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">phone</i>
          <input id="phone_number" type="tel" class="validate" >
          <label for="phone_number">Phone Number</label>
        </div>
					  <div class="input-field col s6">
          <i class="material-icons prefix">create</i>
          <input id="pin_code" type="text" class="validate" >
          <label for="pin_code">PIN Code</label>
        </div>
        
      </div>
			   <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">place</i>
          <input id="district" type="text" class="validate" >
          <label for="district">District</label>
        </div>
      <div class="input-field col s6">
			<i class="material-icons prefix">place</i>
          <input id="address" type="text" class="validate">
          <label for="address">Address</label>
        </div>
      </div>
			   
			       <div class="row">
          <div class="input-field col s6">
          <i class="material-icons prefix">location_city</i>
          <input id="city" type="text" class="validate" >
          <label for="city">City</label>
        </div>
        <div class="input-field col s6">
			<i class="material-icons prefix">place</i>
          <input id="state" type="text" class="validate">
          <label for="state">State</label>
        </div>
      </div>
			     
			     <div class="row">
           <div class="input-field col s6">
			<i class="material-icons prefix">business_center</i>
          <input id="gst_number" type="text" class="validate">
          <label for="gst_number">GST Number</label>
        </div>
					    <div class="input-field col s6">
			<i class="material-icons prefix">business_center</i>
          <input id="license" type="text" class="validate">
          <label for="license">License Number</label>
        </div>
			   </div>
			   
			   <div class="row">
				    <div class="input-field col s6">
			<i class="material-icons prefix">account_circle</i>
          <input type="text" class="validate">
          <label for="service">Choose a Sevice:
<input id="service" list="services" name="myservices" /></label>
<datalist id="services">
  <option value="Fertilisers">
  <option value="Irrigation">
  <option value="Transport">
  <option value="Warehouse">
  <option value="Packaging">
</datalist>
						
        </div>
			   </div>
   
			    


<div class="row">
   <div class="col s12 m12 l12 top_marg">
		<a class="waves-effect waves-light btn-small" onclick="signup_service_provider()">save</a>
			   </div>
       
			   </div>
    </form>
        
        `;
    }
    selEle.innerHTML = temp;
}







//##########################  signing user in  ##################
var signup_error_code = 0

// ##################################################################
// ###########################   FARMER   ###########################
// ##################################################################

function signup_farmer() {
    email = document.getElementById("email").value;
    password = document.getElementById("pwd").value;
    firebase.auth().createUserWithEmailAndPassword(email, password).catch(function (error) {
        // Handle Errors here.
        signup_error_code = 1;
        var errorCode = error.code;
        var errorMessage = error.message;
        // ...
    });

    if (signup_error_code == 1) {
        alert("there was some problem in signing you up!!");
    }
    else {
        var fname = document.getElementById("first_name").value;
        var lname = document.getElementById("last_name").value;
        var name = fname + " " + lname
        var phone = document.getElementById("phone_number").value;
        var address = document.getElementById("address").value;
        var district = document.getElementById("district").value;
        var house = document.getElementById("house_number").value;
        var city = document.getElementById("city").value;
        var state = document.getElementById("state").value;
        var farm_area = document.getElementById("farm_area").value;
        var pin = document.getElementById("pin_code").value;
        var police = document.getElementById("police_station").value;
        var post = document.getElementById("post_office").value;
        var aadhar = document.getElementById("aadhar").value;

        email = document.getElementById("email").value;
        // Add a new document in collection "Farmer"
        db.collection("Farmer").doc(email).set({
            Address: address,
            Area: farm_area,
            District: district,
            Email: email,
            House: house,
            Phone: phone,
            Pin_code: pin,
            Police: police,
            Post: post,
            Name: name,
            State: state,
            City: city,
            Aadhar: aadhar
        })
            .then(function () {
                console.log("Document successfully written!");
                window.location.href = "/";
            })
            .catch(function (error) {
                console.error("Error writing document: ", error);
            });
    }
}


// ############################################################
// ######################  BIG SELLER  ########################
// ############################################################

function signup_bigseller() {
    email = document.getElementById("email").value;
    password = document.getElementById("pwd").value;
    firebase.auth().createUserWithEmailAndPassword(email, password).catch(function (error) {
        // Handle Errors here.
        signup_error_code = 1;
        var errorCode = error.code;
        var errorMessage = error.message;
        // ...
    });

    if (signup_error_code == 1) {
        alert("there was some problem in signing you up!!");
    }
    else {
        var fname = document.getElementById("first_name").value;
        var lname = document.getElementById("last_name").value;

        var name = fname + " " + lname
        var phone = document.getElementById("phone_number").value;
        var address = document.getElementById("address").value;
        var pin = document.getElementById("pin_code").value;
        var state = document.getElementById("state").value;
        var gst_number = document.getElementById("gst_number").value;
        var license = document.getElementById("license").value;

        var Type = 'big';
        var email = document.getElementById('email').value;


        db.collection("Buyer").doc(email).set({
            Address: address,
            Email: email,
            Phone: phone,
            Pin_code: pin,
            Name: name,
            State: state,
            GST: gst_number,
            License: license,
            Type: Type
        })
            .then(function () {
                console.log("Document successfully written!");
                window.location.href = "/";
            })
            .catch(function (error) {
                console.error("Error writing document: ", error);
            });


    }
}



// ############################################################
// ######################  MANDI SELLER  ########################
// ############################################################

function signup_mandiseller() {
    email = document.getElementById("email").value;
    password = document.getElementById("pwd").value;
    firebase.auth().createUserWithEmailAndPassword(email, password).catch(function (error) {
        // Handle Errors here.
        signup_error_code = 1;
        var errorCode = error.code;
        var errorMessage = error.message;
        // ...
    });

    if (signup_error_code == 1) {
        alert("There was some problem in signing you up!!");
    }
    else {
        var fname = document.getElementById("first_name").value;
        var lname = document.getElementById("last_name").value;

        var name = fname + " " + lname
        var phone = document.getElementById("phone_number").value;
        var address = document.getElementById("address").value;
        var pin = document.getElementById("pin_code").value;
        var district = document.getElementById("district").value;
        var state = document.getElementById("state").value;
        var city = document.getElementById("city").value;
        var gst_number = document.getElementById("gst_number").value;
        var license = document.getElementById("license").value;
        var aadhar = document.getElementById("aadhar").value;

        var Type = 'mandi'
        var email = document.getElementById('email').value;


        db.collection("Buyer").doc(email).set({
            Address: address,
            Email: email,
            Phone: phone,
            Pin_code: pin,
            Name: name,
            District: district,
            City: city,
            State: state,
            Aadhar: aadhar,
            GST: gst_number,
            License: license,
            Type: Type
        })
            .then(function () {
                console.log("Document successfully written!");
                window.location.href = "/";

            })
            .catch(function (error) {
                console.error("Error writing document: ", error);
            });
    }
}



// ############################################################
// ######################  LOCAL SELLER  ########################
// ############################################################

function signup_localseller() {
    email = document.getElementById("email").value;
    password = document.getElementById("pwd").value;
    firebase.auth().createUserWithEmailAndPassword(email, password).catch(function (error) {
        // Handle Errors here.
        signup_error_code = 1;
        var errorCode = error.code;
        var errorMessage = error.message;
        // ...
    });

    if (signup_error_code == 1) {
        alert("There was some problem in signing you up!!");
    }
    else {
        var fname = document.getElementById("first_name").value;
        var lname = document.getElementById("last_name").value;

        var name = fname + " " + lname
        var phone = document.getElementById("phone_number").value;
        var address = document.getElementById("address").value;
        var pin = document.getElementById("pin_code").value;
        var district = document.getElementById("district").value;
        var state = document.getElementById("state").value;
        var city = document.getElementById("city").value;
        var aadhar = document.getElementById("aadhar_number").value;

        var Type = 'local'
        var email = document.getElementById('email').value;


        db.collection("Buyer").doc(email).set({
            Address: address,
            Email: email,
            Phone: phone,
            Pin_code: pin,
            Name: name,
            District: district,
            City: city,
            State: state,
            Aadhar: aadhar,
            Type: Type
        })
            .then(function () {
                console.log("Document successfully written!");
                window.location.href = "/buyerhome";
            })
            .catch(function (error) {
                console.error("Error writing document: ", error);
            });
    }
}



// ##################################################################
// ######################  SERVICE PROVIDER  ########################
// ##################################################################

function signup_service_provider() {
    email = document.getElementById("email").value;
    password = document.getElementById("pwd").value;

    


    firebase.auth().createUserWithEmailAndPassword(email, password).catch(function (error) {
        // Handle Errors here.
        signup_error_code = 1;
        var errorCode = error.code;
        var errorMessage = error.message;
        // ...
    });

    if (signup_error_code == 1) {
        alert("There was some problem in signing you up!!");
    }
    else {
        var fname = document.getElementById("first_name").value;
    var lname = document.getElementById("last_name").value;

    var name = fname + " " + lname
    var phone = document.getElementById("phone_number").value;
    var address = document.getElementById("address").value;
    var pin = document.getElementById("pin_code").value;
    var district = document.getElementById("district").value;
    var state = document.getElementById("state").value;
    var city = document.getElementById("city").value;
    var gst_number = document.getElementById("gst_number").value;
    var license = document.getElementById("license").value;
    var Type = document.getElementById("service").value;

    var email = document.getElementById('email').value;

        db.collection("Service").doc(email).set({
            Address: address,
            Email: email,
            Phone: phone,
            Pin_code: pin,
            Name: name,
            District: district,
            City: city,
            State: state,
            GST: gst_number,
            License: license,
            Type: Type
        })
            .then(function () {
                console.log("Document successfully written!");
            })
            .catch(function (error) {
                console.error("Error writing document: ", error);
            });
    }
}



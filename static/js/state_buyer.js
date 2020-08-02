//state persistance.
var userEmail = "";
firebase.auth().onAuthStateChanged(function (user) {
    if (user) {
        // User is signed in.
        userEmail = user.email;
        console.log("persistance: ", userEmail);

        const buyer = db.collection('Buyer').doc(userEmail).get().then(function (doc) {
            if (doc.exists) {
                
                if(doc.data().Type == "local"){//console.log(doc.data())
                document.getElementById("buy_auction_button_container").innerHTML = `<li><a href="/buyerbuy">Buy</a></li>

                <li id="profile_button_container"></li>
                <li class="lang-hin"><a class="waves-effect waves-light btn" onclick="languageChanger()">भाषा</a></li>
                <li class="lang-eng"><a class="waves-effect waves-light btn" onclick="languageChanger()">LANGUAGE</a></li>
                <li><a class="waves-effect waves-light btn" href="#" onclick="logout()">Logout</a></li>
            `}else{
                //console.log(doc.data())
                document.getElementById("buy_auction_button_container").innerHTML = `<li><a href="/buyerbuy">Buy</a></li>
                <li><a href="/buyerauction" id="auction_nav">Auction</a></li>

                <li id="profile_button_container"></li>
                <li class="lang-hin"><a class="waves-effect waves-light btn" onclick="languageChanger()">भाषा</a></li>
                <li class="lang-eng"><a class="waves-effect waves-light btn" onclick="languageChanger()">LANGUAGE</a></li>
                <li><a class="waves-effect waves-light btn" href="#" onclick="logout()">Logout</a></li>

            `
            }
                try {
                    selEle = document.getElementById("profile_button_container");
                    if (doc.data().Type == 'big') {
                        selEle.innerHTML = `<a class="waves-effect waves-light btn" href="/bigbuyerprofile">Profile</a>`;

                        //################   set profile details for big buyer   ###############

                        document.getElementById("bigsellername").innerText = doc.data().Name;
                        document.getElementById("bigsellerphone").innerText = doc.data().Phone;
                        document.getElementById("bigselleraddress").innerText = doc.data().Address;

                        document.getElementById("bigsellerphone1").innerText = doc.data().Phone;
                        document.getElementById("bigsellerpin").innerText = doc.data().Pin_code;
                        document.getElementById("bigselleremail").innerText = doc.data().Email;
                        document.getElementById("bigselleraddress1").innerText = doc.data().Address;
                        document.getElementById("bigsellergst").innerText = doc.data().GST;
                        document.getElementById("bigsellerlicense").innerText = doc.data().License;
                        document.getElementById("bigsellerstate").innerText = doc.data().State;
                    }
                    else if (doc.data().Type == 'local') {
                        //###########   local seller link
                        selEle.innerHTML = `<a class="waves-effect waves-light btn" href="/localbuyerprofile">Profile</a>`;

                        //################   set profile details for local buyer   ###############

                        document.getElementById("localsellername").innerText = doc.data().Name;
                        document.getElementById("localselleraadhar").innerText = doc.data().Aadhar;
                        document.getElementById("localselleremail").innerText = doc.data().Email;

                        document.getElementById("localsellerphone").innerText = doc.data().Phone;
                        document.getElementById("localsellerpin").innerText = doc.data().Pin_code;
                        document.getElementById("localselleraddress").innerText = doc.data().Address;
                        document.getElementById("localsellergst").innerText = doc.data().GST;
                        document.getElementById("license").innerText = doc.data().License;
                        document.getElementById("localsellerstate").innerText = doc.data().State;
                        document.getElementById("localsellerdistrict").innerText = doc.data().District;
                    }
                    else if (doc.data().Type == 'mandi') {
                        //###########  mandi seller link
                        selEle.innerHTML = `<a class="waves-effect waves-light btn" href="/mandibuyerprofile">Profile</a>`;

                        document.getElementById("mandiname").innerText = doc.data().Name;
                        document.getElementById("mandiaadhar").innerText = doc.data().Aadhar;
                        document.getElementById("mandiemail").innerText = doc.data().Email;

                        document.getElementById("mandiphone").innerText = doc.data().Phone;
                        document.getElementById("mandiaadhar1").innerText = doc.data().Aadhar;
                        document.getElementById("mandipin").innerText = doc.data().Pin_code;
                        document.getElementById("mandiaddress").innerText = doc.data().Address;
                        document.getElementById("mandigst").innerText = doc.data().GST;
                        document.getElementById("mandilicense").innerText = doc.data().License;
                        document.getElementById("mandistate").innerText = doc.data().State;
                        document.getElementById("mandidistrict").innerText = doc.data().District;
                    }
                    else {
                        console.log("no details found!");
                    }
                }
                catch (e) {
                    console.log(e)
                }
            }

            })
        // ...
    } else {
        // User is signed out.
        // ...
        console.log("no user found!");
        console.log("Login to our site!");
        //controlling navbar

    }
});

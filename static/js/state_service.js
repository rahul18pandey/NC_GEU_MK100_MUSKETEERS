//state persistance.
var userEmail = ""

firebase.auth().onAuthStateChanged(function (user) {
    if (user) {
        // User is signed in.
        userEmail = user.email;
        console.log("persistance: ", userEmail);

        //controling nav bar:

        var docRef = db.collection("Service").doc(userEmail);

        docRef.get().then(function (docservice) {
            if (docservice.exists) {
                console.log("Document data:", docservice.data());
                document.getElementById("servicename").innerText = docservice.data().Name
                document.getElementById("serviceaddress").innerText = docservice.data().Address
                document.getElementById("serviceprofession").innerText = docservice.data().Type
                document.getElementById("servicephone").innerText = docservice.data().Phone
                document.getElementById("serviceemail").innerText = docservice.data().Email
                document.getElementById("servicepin").innerText = docservice.data().Pin_code
                document.getElementById("serviceaddress1").innerText = docservice.data().Address
                document.getElementById("servicedist").innerText = docservice.data().District
                document.getElementById("servicecity").innerText = docservice.data().City
                document.getElementById("servicegst").innerText = docservice.data().GST
                document.getElementById("servicelicense").innerText = docservice.data().License
            } else {
                // doc.data() will be undefined in this case
                console.log("No such document!");
            }
        }).catch(function (error) {
            console.log("Error getting document:", error);
        });

        //display services
        service_holder = document.getElementById("addedserviceholder");
        db.collection("Added_Service").where("Email", "==", userEmail)
            .get()
            .then(function (querySnapshot) {
                querySnapshot.forEach(function (doc) {
                    // doc.data() is never undefined for query doc snapshots
                    console.log(doc.id, " => ", doc.data());
                    service_holder.innerHTML += `
                    <tr>
                    <td>`+doc.data().Service_type+`</td>
                    <td>`+doc.data().Charges+`</td>
                    </tr>
                    `;
                });
            })
            .catch(function (error) {
                console.log("Error getting documents: ", error);
            });


        // ...
    } else {
        // User is signed out.
        // ...
        console.log("no user found!")
        //controlling navbar

    }
});



//##########  logout   ###########

function logout() {
    firebase.auth().signOut()
        .then(function () {
            // Sign-out successful.
            alert("Logged out!")
            window.location = "/"
        })
        .catch(function (error) {
            // An error happened
            alert("Error in logging out!");
            console.log("Error: ", error);
        });
}
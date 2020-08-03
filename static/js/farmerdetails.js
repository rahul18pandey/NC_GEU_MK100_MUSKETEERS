function getstate(type) {
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            // User is signed in.
            userEmail = user.email;

            userDetails = db.collection(type).doc(userEmail).get().then(function (doc) {
                if (doc.exists) {
                    console.log("Document data:", doc.data());

                    document.getElementById('farmername').innerText = doc.data().Name
                    document.getElementById('farmeraadhar').innerText = doc.data().Aadhar
                    document.getElementById('farmeraddress').innerText = doc.data().Address


                    document.getElementById('farmerphone').innerText = doc.data().Phone
                    document.getElementById('farmeremail').innerText = doc.data().Email

                    document.getElementById('farmeraadhar1').innerText = doc.data().Aadhar
                    document.getElementById('farmerarea').innerText = doc.data().Area
                    document.getElementById('farmerpin').innerText = doc.data().Pin_code
                    document.getElementById('farmerpolicestation').innerText = doc.data().Police
                    document.getElementById('farmerpostoffice').innerText = doc.data().Post
                    document.getElementById('farmerdistrict').innerText = doc.data().District
                    document.getElementById('farmerhouse').innerText = doc.data().House
                    document.getElementById('farmercity').innerText = doc.data().City
                    document.getElementById('farmerstate').innerText = doc.data().State












                } else {
                    // doc.data() will be undefined in this case
                    console.log("No such document!");
                }
            }).catch(function (error) {
                console.log("Error getting document:", error);
            });


            // ...
        } else {
            // User is signed out.
            // ...
            alert("login our website!")
            //controlling navbar

        }
    });
}
getstate('Farmer');
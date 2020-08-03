console.log('add service page')
  function setService(serv) {
    // Add a new document in collection "cities"


    var docRef = db.collection("Service").doc(userEmail);

    docRef.get().then(function (docservice) {
      if (docservice.exists) {
        console.log("Document data:", docservice.data());


        db.collection("Added_Service").doc().set({
          Email: userEmail,
          Phone: docservice.data().Phone,
          Service_type: serv[0],
          Charges: serv[1],
          Type: docservice.data().Type
        })
          .then(function () {
            console.log("Document successfully written!");
            alert("service added!");
            var empTab = document.getElementById('empTable').innerHTML="";
            
          })
          .catch(function (error) {
            console.error("Error writing document: ", error);
          });



      } else {
        // doc.data() will be undefined in this case
        console.log("No such document!");
      }
    }).catch(function (error) {
      console.log("Error getting document:", error);
    });


  }
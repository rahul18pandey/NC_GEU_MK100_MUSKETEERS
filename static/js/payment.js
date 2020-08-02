console.log('payment pge called')
var thisbid = ""
var thiscrop = ""
var thisquantity = ""
var thisbuyer = ""


db.collection("Buyer").doc(document.getElementById("buyeremail").innerText).get().then(function (docbuyer) {
    console.log('doc.data().Name', docbuyer.data().Name)
    document.getElementById("buyername_container").innerText = docbuyer.data().Name
    bidding_ref = db.collection("Bidding")
    bidding_ref.where("Buyer_email", "==", docbuyer.data().Email).get()
        .then(function (querySnapshot) {
            querySnapshot.forEach(function (docbidding) {
                // doc.data() is never undefined for query doc snapshots

                if (docbidding.data().Farmer_email == userEmail) {
                    if (docbidding.data().Crop_type == document.getElementById("croptype").value) {
                        console.log(docbidding.id, " => ", docbidding.data());

                        crop_ref = db.collection("Farmer_Crop").where("Email", "==", userEmail).get()
                            .then(function (querySnapshot) {
                                querySnapshot.forEach(function (doccrop) {
                                    // doc.data() is never undefined for query doc snapshots
                                    if(document.getElementById("croptype").value == doccrop.data().Type){
                                        document.getElementById("qyantity_container").innerText =  doccrop.data().Quantity;
                                        document.getElementById("price_container").innerText =  docbidding.data().Current_bid;
                                        console.log('doccrop.id', doccrop.id)
                                        thisbuyer = docbuyer.data().Email
                                        thisquantity = doccrop.data().Quantity
                                        thiscrop = doccrop.data().Type
                                        thisbid = docbidding.data().Current_bid


                                    }

                                });
                            })
                            .catch(function (error) {
                                console.log("Error getting documents: ", error);
                            });
                    }
                }
            });
        })
        .catch(function (error) {
            console.log("Error getting documents: ", error);
        });
})

function farmer_rate() {
    console.log("rate", rateValue);
    db.collection("Transaction").doc().set({
        Buyer_Rating: rateValue,
        Counter: 1,
        Email: thisbuyer,
        Farmer_Rating: "",
        Farmer_email: userEmail,
        Quantity: thisquantity,
        Remain_quantity: thisquantity,
        Service_Rating: "",
        Type: thiscrop,
    })
    .then(function() {
        console.log("Document successfully written!");
    })
    .catch(function(error) {
        console.error("Error writing document: ", error);
    });
  }

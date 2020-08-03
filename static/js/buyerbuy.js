function buyerbuy() {
    console.log("buyerbuy() function called");

    crop_type = document.getElementById("crop_type").value;
    crop_quantity = document.getElementById("crop_quantity").value;

    if (crop_quantity == '' || crop_type == '') {
        alert("please fill the required fields!");
    } else {


        db.collection("Buyer_Purchase").doc().set({
            Email: userEmail,
            Crop_type: crop_type,
            Quantity: crop_quantity
        })
            .then(function () {
                console.log("Document successfully written!");
                alert("Crop add successful!!")
            })
            .catch(function (error) {
                console.error("Error writing document: ", error);
            });
    }
}



// ###############################################################
// ####################   display farmer's details  ##############
// ###############################################################

setTimeout(buyershow, 1000)
function buyershow(){
console.log('userEmail', userEmail)

db.collection("Buyer").where("Email", "==", userEmail)
    .get()
    .then(function (querySnapshot) {
        querySnapshot.forEach(function (docbuyer) {
            // doc.data() is never undefined for query doc snapshots
            console.log(docbuyer.id, " => ", docbuyer.data());
            console.log('userEmail', userEmail)

            if (docbuyer.data().Type == "local") {



                db.collection("Farmer_Crop").get().then(function (querySnapshot) {
                    querySnapshot.forEach(function (doc) {
                        // doc.data() is never undefined for query doc snapshots
                        console.log(doc.id, " => ", doc.data().Quantity);

                        if(parseInt(doc.data().Quantity) <= 100){
                        Email = doc.data().Email

                        db.collection("Farmer").doc(Email).get().then(function (doc1) {
                            console.log("docreading", doc1.data())

                            farmertable = document.getElementById("farmerlist");
                            temp = `
            <tr>

                <td><a href="bigsellerprofiefarmer.html">`+ doc1.data().Name + `</a></td>
                <td>`+ doc1.data().Address + `</td>
                <td>`+ doc.data().Type + `</td>
                <td>`+ doc.data().Base_price + `</td>
                <td>`+ doc.data().Quantity + `</td>
                <td>`+ doc.data().View_date + `</td>
                <td>-</td>
                <td>
                <!--
                    <div class="switch">
                        <label>
                            no
                            <input type="checkbox">
                            <span class="lever"></span>
                            yes
                        </label>
                    </div>
                    -->
                    <button> BUY </button>
                </td>



            </tr>
        `;
                            farmertable.innerHTML += temp;
                        });


                    }
                        //

                    });
                });


            } else if (docbuyer.data().Type == "mandi" || docbuyer.data().Type == "big") {


                db.collection("Farmer_Crop").get().then(function (querySnapshot) {
                    querySnapshot.forEach(function (doc) {
                        // doc.data() is never undefined for query doc snapshots
                        console.log(doc.id, " => ", doc.data().Email);


                        Email = doc.data().Email

                        db.collection("Farmer").doc(Email).get().then(function (doc1) {
                            console.log("docreading", doc1.data())

                            farmertable = document.getElementById("farmerlist");
                            temp = `
            <tr>

                <td><a href="bigsellerprofiefarmer.html">`+ doc1.data().Name + `</a></td>
                <td>`+ doc1.data().Address + `</td>
                <td>`+ doc.data().Type + `</td>
                <td>`+ doc.data().Base_price + `</td>
                <td>`+ doc.data().Quantity + `</td>
                <td>`+ doc.data().View_date + `</td>
                <td>`+ doc.data().Auction_date + `</td>
                <td>
                    <div class="switch">
                        <label>
                            no
                            <input type="checkbox">
                            <span class="lever"></span>
                            yes
                        </label>
                    </div>
                </td>



            </tr>
        `;
                            farmertable.innerHTML += temp;
                        });

                    });
                });


            }

        });
    })
    .catch(function (error) {
        console.log("Error getting documents: ", error);
    });
}
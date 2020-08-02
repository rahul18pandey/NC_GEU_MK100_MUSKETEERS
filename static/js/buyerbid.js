//this js file is used in buyerauction.html and buyerbidding.html
dt = new Date();
var auction_date


if (pageName == "buyerauction") {
    auction_list = document.getElementById("auctiontable_container");
    db.collection("Farmer_Crop").get().then(function (querySnapshot) {
        querySnapshot.forEach(function (docf) {
    db.collection("Buyer").where("Email", "==", userEmail).get().then(function (querySnapshot) {
        querySnapshot.forEach(function (docbuyer) {
            

            //condition for local buyer:
            if(docbuyer.data().Type == "local" && parseInt(docf.data().Quantity) <= 100){
               
               console.log('docf.data().Quantity', docf.data().Quantity)
                db.collection("Farmer").where("Email", "==", docf.data().Email)
                .get()
                .then(function (querySnapshot) {
                    querySnapshot.forEach(function (doc) {
                        // doc.data() is never undefined for query doc snapshots



                        // db.collection("Farmer").where("Email", "==", docf.data().Email).get().then(function (doc) {
                        //     console.log("foundddddddddddddddddd");
                        //     console.log(doc.data().Name);
                        // })
                        temp = `
            
            
        <div class="card horizontal s12" style="margin-left: 10%;margin-top: 0%; width: 70%">

        <div id="irr_img1">
            <img src="./static/theme_images/th.jpg" alt="pic:)"
                style="height: 200px;width: 200px;border-radius:  50%;">
        </div>
        <div class="card-stacked">
            <div class="card-content mastfont">
                <div class="col">
                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_name1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"> <b> FARMER'S NAME:</b></font>
                        </div>
                        <div id="auc_name1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ doc.data().Name + `</div>
                    </div>


                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_crop1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"> <b> CROP TYPE:</b></font>
                        </div>
                        <div id="auc_crop1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ docf.data().Type + `</div>
                    </div>



                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_base1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"><b> BASE PRICE:</b></font>
                        </div>
                        <div id="auc_base1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ docf.data().Base_price + `</div>

                    </div>
                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_view1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"> <b> VIEW DATE:</b></font>
                        </div>
                        <div id="auc_view1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ docf.data().View_date + `</div>

                    </div>
                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_date1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"> <b> AUCTION DATE:</b></font>
                        </div>
                        <div id="auc_date1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ docf.data().Auction_date + `</div>

                    </div>
                    <!--			<div id="enter-auc"><a href="auction-buyer.html">ENTER AUCTION</a></div >-->


                </div>
                <div class="card-action">
                    <a href="/buyerbidding?id=`+ docf.id + `">ENTER AUCTION</a>
                </div>
            </div>
        </div>
    </div>
            `;

                        auction_list.innerHTML += temp;


                    });
                })
                .catch(function (error) {
                    console.log("Error getting documents: ", error);
                });


            }
            if(docbuyer.data().Type == "mandi" || docbuyer.data().Type == "big"){
            // if(current_date == )
            // doc.data() is never undefined for query doc snapshots
            db.collection("Farmer").where("Email", "==", docf.data().Email)
                .get()
                .then(function (querySnapshot) {
                    querySnapshot.forEach(function (doc) {
                        // doc.data() is never undefined for query doc snapshots



                        // db.collection("Farmer").where("Email", "==", docf.data().Email).get().then(function (doc) {
                        //     console.log("foundddddddddddddddddd");
                        //     console.log(doc.data().Name);
                        // })
                        temp = `
            
            
        <div class="card horizontal s12" style="margin-left: 15%;margin-top: 0%; width: 70%">

        <div id="irr_img1">
            <img src="./static/theme_images/th.jpg" alt="pic:)"
                style="height: 200px;width: 200px;border-radius:  50%;">
        </div>
        <div class="card-stacked">
            <div class="card-content mastfont">
                <div class="col">
                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_name1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"> <b> FARMER'S NAME:</b></font>
                        </div>
                        <div id="auc_name1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ doc.data().Name + `</div>
                    </div>


                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_crop1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"> <b> CROP TYPE:</b></font>
                        </div>
                        <div id="auc_crop1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ docf.data().Type + `</div>
                    </div>



                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_base1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"><b> BASE PRICE:</b></font>
                        </div>
                        <div id="auc_base1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ docf.data().Base_price + `</div>

                    </div>
                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_view1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"> <b> VIEW DATE:</b></font>
                        </div>
                        <div id="auc_view1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ docf.data().View_date + `</div>

                    </div>
                    <div class="row" style="height: 35%;background-color: transparent;">
                        <div id="auc_date1" class="k_heading"
                            style="height: 20px;width: 25%;background-color: transparent;">
                            <font color="black"> <b> AUCTION DATE:</b></font>
                        </div>
                        <div id="auc_date1_val"
                            style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                            `+ docf.data().Auction_date + `</div>

                    </div>
                    <!--			<div id="enter-auc"><a href="auction-buyer.html">ENTER AUCTION</a></div >-->


                </div>
                <div class="card-action">
                    <a href="/buyerbidding?id=`+ docf.id + `">ENTER AUCTION</a>
                </div>
            </div>
        </div>
    </div>
            `;
            
            if(docf.data().Auction_date.split("-")[0] == dt.getDate()){

                        auction_list.innerHTML += temp;
}

                    });
                })
                .catch(function (error) {
                    console.log("Error getting documents: ", error);
                });

            }




            });
        });





        });
    });
}



var current_max_bid = 0
var current_crop_type = ""
var current_farmer_email = ""
var bid_doc_id = ""
var current_max_buyer = ""

if (pageName == "buyerbidding") {
    id = document.getElementById("docid").innerText;
    bid_table = document.getElementById("bid_table_container");


    console.log('id', id);

    var docRef = db.collection("Farmer_Crop").doc(id);

    docRef.get().then(function (doc) {
        if (doc.exists) {
            current_date = dt.getDate();
            ad = doc.data().Auction_date
            auctn_dt = ad.split("-")[0];
            console.log('ad', ad);
            console.log('auctn_dt', auctn_dt);
            auction_date = auctn_dt


            //get farmer name
            db.collection("Farmer").doc(doc.data().Email).get().then(function (docf) {
                document.getElementById("farmer_name").innerText = docf.data().Name;
                return (docf.data())
            })

            //display crop type and base price
            document.getElementById("display_base_price").innerText = doc.data().Base_price;
            document.getElementById("display_crop_type").innerText = doc.data().Type
            current_crop_type = doc.data().Type
            current_farmer_email = doc.data().Email




            //get table content for all the buyers


            db.collection("Bidding").where("Farmer_email", "==", doc.data().Email).where("Crop_type", "==", doc.data().Type)
                .onSnapshot(function (querySnapshot) {
                    querySnapshot.forEach(function (doca) {

                        bid_table.innerHTML = ""
                        buyerEmail = doca.data().Buyer_email
                        farmerEmail = doca.data().farmer_email

                        db.collection("Buyer").doc(buyerEmail).get().then(function (docb) {

                            bid_table.innerHTML += `
                        <tr>
                            <td>`+ docb.data().Name + `</td>
                            <td>`+ doc.data().Quantity + `</td>
                            <td>`+ doca.data().Current_bid + `</td>
                        </tr>
                        `;
                            bd = parseInt(doca.data().Current_bid)
                            if (current_max_bid <= bd) {
                                current_max_bid = bd
                                current_max_buyer = doca.data().Buyer_email
                            }
                            if (doca.data().Buyer_email == userEmail) {
                                bid_doc_id = doca.id;
                            }

                        })


                    });
                });











        } else {
            // doc.data() will be undefined in this case
            console.log("No such document!");
        }
    }).catch(function (error) {
        console.log("Error getting document:", error);
    });
}




function set_bid() {

    //db.collection('Farmer_Crop').
    bid_value = document.getElementById("bid_value").value;
    doc_id = document.getElementById("docid").innerText;

    confirmation = confirm("Do you want to enter bid value: " + bid_value)
    if (confirmation == true && bid_value != "") {

        if (bid_value > current_max_bid) {


            if (bid_doc_id != "") {
                var bidding_ref = db.collection("Bidding").doc(bid_doc_id);


                // Set the "capital" field of the city 'DC'
                return bidding_ref.update({
                    Current_bid: bid_value
                })
                    .then(function () {
                        console.log("Document successfully updated!");



                        var farmer_crop_ref = db.collection("Farmer_Crop").doc(doc_id);
                        // Set the "capital" field of the city 'DC'
                        return farmer_crop_ref.update({
                            Current_bid: current_max_bid
                        })
                            .then(function () {
                                console.log("Document successfully updated!");
                            })
                            .catch(function (error) {
                                // The document probably doesn't exist.
                                console.error("Error updating document: ", error);
                            });


                    })
                    .catch(function (error) {
                        // The document probably doesn't exist.
                        console.error("Error updating document: ", error);
                    });


            }
            else {
                var bidding_ref = db.collection("Bidding").doc().set({
                    Buyer_email: userEmail,
                    Crop_type: current_crop_type,
                    Farmer_email: current_farmer_email,
                    Current_bid: bid_value
                })
                    .then(function () {
                        var farmer_crop_ref = db.collection("Farmer_Crop").doc(doc_id);
                        // Set the "capital" field of the city 'DC'
                        return farmer_crop_ref.update({
                            Current_bid: current_max_bid
                        })
                            .then(function () {
                                console.log("Document successfully updated!");
                            })
                            .catch(function (error) {
                                // The document probably doesn't exist.
                                console.error("Error updating document: ", error);
                            });
                        console.log("Document successfully written!");
                    })
                    .catch(function (error) {
                        console.error("Error writing document: ", error);
                    });








            }
        }
        else {
            alert("You must enter bid with higher value!")
        }
    } else {
        alert("Not valid!!")
    }
}



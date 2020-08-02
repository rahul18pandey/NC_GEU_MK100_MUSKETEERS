//farmer bidding handeler page
var auction_date
var current_max_bid = 0
var current_max_buyer = ""
var croptype = ""



firebase.auth().onAuthStateChanged(function (user) {
    if (user) {
        // User is signed in.
        userEmail = user.email;
        console.log("persistance: ", userEmail);


        auction_table = document.getElementById("auctiontable_container");
        const farmer = db.collection('Farmer').doc(userEmail).get().then(function (docf) {
            if (docf.exists) {

                const Farmer_crop = db.collection("Farmer_Crop").where("Email", "==", userEmail).get().then(function (querySnapshot) {
                    querySnapshot.forEach(function (doc) {
                        // doc.data() is never undefined for query doc snapshots
                        console.log('pageName', pageName)
                        if (doc.data().Email == userEmail && pageName == "farmerauction") {
                            //console.log(doc.id, " => ", doc.data());
                            temp = `
                                <div class="card horizontal" style="margin-left: 10%;margin-top: 0%; width: 70%">


                                     <div id="irr_img1">
                                        <img src="./static/theme_images/th.jpg" alt="pic:)" style="height: 200px;width: 200px;border-radius:  50%;">
                                    </div>
                                    <div class="card-stacked">
                                        <div class="card-content mastfont">
                                            <div class="col">

                                                <div class="row" style="height: 35%;background-color: transparent;">
                                                    <div id="auc_crop3" class="k_heading" style="height: 20px;width: 25%;background-color: transparent;">
                                                        <font color="black"> <b> CROP TYPE:</b></font>
                                                    </div>
                                                    <div id="auc_crop3_val" style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                                                        `+ doc.data().Type + `
                                                    </div>
                                                </div>



                            <div class="row" style="height: 35%;background-color: transparent;">
                                <div id="auc_base3" class="k_heading"
                                    style="height: 20px;width: 25%;background-color: transparent;">
                                    <font color="black"><b> BASE PRICE:</b></font>
                                </div>
                                <div id="auc_base3_val"
                                    style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                                    `+ doc.data().Base_price + `</div>

                            </div>
                            <div class="row" style="height: 35%;background-color: transparent;">
                                <div id="auc_view3" class="k_heading"
                                    style="height: 20px;width: 25%;background-color: transparent;">
                                    <font color="black"> <b> VIEW DATE:</b></font>
                                </div>
                                <div id="auc_view3_val"
                                    style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                                    `+ doc.data().View_date + `</div>

                            </div>
                            <div class="row" style="height: 35%;background-color: transparent;">
                                <div id="auc_date3" class="k_heading"
                                    style="height: 20px;width: 25%;background-color: transparent;">
                                    <font color="black"> <b> AUCTION DATE:</b></font>
                                </div>
                                <div id="auc_date3_val"
                                    style="margin-left:40%;height: 20px;width: 50%;background-color: transparent;margin-top: -2.5%;font-size: 25px;">
                                    `+ doc.data().Auction_date + `</div>

                            </div>
                            <!--			<div id="enter-auc"><a href="auction-buyer.html">ENTER AUCTION</a></div >-->


                        </div>

                        <!--			<div id="enter-auc"><a href="auction-buyer.html">ENTER AUCTION</a></div >-->



                        <div class="card-action">
                            <a href="/farmerbidding?id=`+ doc.id + `">ENTER AUCTION</a>
                        </div>
                    </div>
                </div>
            </div>
                    `;

                            auction_table.innerHTML += temp;
                        }
                        if (pageName == "farmerbidding") {
                            id = document.getElementById("docid").innerText;
                            if (doc.id == id) {
                                document.getElementById("farmername_container").innerText = docf.data().Name
                                document.getElementById("crop_type_container").innerText = doc.data().Type
                                document.getElementById("base_price_container").innerText = doc.data().Base_price

                                croptype = doc.data().Type
                                auction_date = doc.data().Auction_date
                                auction_date = auction_date.split("-")[0]



                                bidding_buyer_table = document.getElementById("bidding_buyer_container");

                                db.collection("Bidding").where("Farmer_email", "==", userEmail).where("Crop_type", "==", doc.data().Type)
                                    .onSnapshot(function (querySnapshot) {
                                        bidding_buyer_table.innerHTML = "";
                                        querySnapshot.forEach(function (docbid) {

                                            console.log('docbid.data().Buyer_email', docbid.data().Buyer_email)

                                            db.collection("Buyer").get()
                                            .then(function(querySnapshot) {
                                                querySnapshot.forEach(function(docbuyer) {
                                                    // doc.data() is never undefined for query doc snapshots
                                                    if(docbid.data().Buyer_email == docbuyer.data().Email){
                                                    console.log(doc.id, " => ", docbuyer.data());

                                                    bidding_buyer_table.innerHTML += `
                                                        <tr>
                                                            <td>`+ docbuyer.data().Name +`</td>
                                                            <td>`+ doc.data().Type +`</td>
                                                            <td>`+ doc.data().Quantity +`</td> 
                                                            <td>`+ docbid.data().Current_bid +`</td> 
                                                            <td><button type="button" onClick="removeBuyer('`+docbuyer.data().Email+`','`+docbuyer.data().Name+`','`+docbid.id+`')" >remove</button></td> 
                                                        </tr>`;

                                                    }
                                                    bd = docbid.data().Current_bid
                                                    if (current_max_bid <= bd) {
                                                        current_max_bid = bd
                                                        current_max_buyer = docbid.data().Buyer_email
                                                    }
                                                });
                                            })
                                            .catch(function(error) {
                                                console.log("Error getting documents: ", error);
                                            });


                                            
                                        });
                                    });







                            }


                        }

                    });
                });


                // if (pageName == "farmerbidding") {
                //     document.getElementById("farmername_container").innerText = docf.data().Name
                //     id = document.getElementById("docid").innerText;
                //   console.log('id', id)
                //     var docRef = db.collection("cities").doc(id);

                //     docRef.get().then(function (doc) {
                //         if (doc.exists) {
                //             console.log("Document data:", doc.data());
                //             document.getElementById("crop_type_container").innerText = doc.data().Name
                //         document.getElementById("base_price_container").innerText = doc.data().Name

                //         } else {
                //             // doc.data() will be undefined in this case
                //             console.log("No such document!");
                //         }
                //     }).catch(function (error) {
                //         console.log("Error getting document:", error);
                //     });
                // }










            }
            else {
                alert("you are not authorized to proceed further!")
            }
        })
    }
})




function removeBuyer(buyerEmail, buyerName, docid){
    console.log('buyerEmail', buyerEmail)
    remove = confirm("Do you really want to remove "+buyerName+" ("+buyerEmail+") from bidding?");
    console.log('remove', remove);
    if(remove){
        db.collection("Bidding").doc(docid).delete().then(function() {
            console.log("Document successfully deleted!");
        }).catch(function(error) {
            console.error("Error removing document: ", error);
        });

    }
}


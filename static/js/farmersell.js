var userPhone = '';
var userAddress = '';

function farmersell() {
    let crop_type = document.getElementById("crop_type").value
    let quantity = document.getElementById("quantity").value
    let view_date_temp = document.getElementById("view_date").value
    let auction_date_temp = document.getElementById("auction_date").value
    let base_price = document.getElementById("base_price").value



    // to be used - crop_type, quantity, base_price, view_date, auction_date
    // get address phone from firebase.
    if (auction_date_temp == '' || view_date_temp == '' || base_price == '' || quantity == '' || crop_type == '') {
        alert("some values may not be filled!")

        let v_date = view_date_temp.split("-");
        let a_date = auction_date_temp.split("-");


        let view_date = v_date[2] + "-" + v_date[1] + "-" + v_date[0];
        let auction_date = a_date[2] + "-" + a_date[1] + "-" + a_date[0];
        console.log(view_date)
        console.log(auction_date)
    }
    else {
        let v_date = view_date_temp.split("-");
        let a_date = auction_date_temp.split("-");


        let view_date = v_date[2] + "-" + v_date[1] + "-" + v_date[0];
        let auction_date = a_date[2] + "-" + a_date[1] + "-" + a_date[0];
        db.collection("Farmer").doc(userEmail).get().then(function (doc) {
            userPhone = doc.data().Phone;
            userAddress = doc.data().Address;

            db.collection("Farmer_Crop").doc().set({
                Address: userAddress,
                Auction_date: auction_date,
                Base_price: base_price,
                Current_bid: "0",
                Email: userEmail,
                Phone: userPhone,
                Quantity: quantity,
                Type: crop_type,
                URL: "https://www.usda.gov/sites/default/files/ers-corn-crop-blog-072919.jpg",
                View_date: view_date
            })
                .then(function () {
                    console.log("Document successfully written!");
                })
                .catch(function (error) {
                    console.error("Error writing document: ", error);
                });
        });

    }
}

//  getting buyer information.
db.collection("Buyer_Purchase").get().then(function (querySnapshot) {
    querySnapshot.forEach(function (doc) {
        // doc.data() is never undefined for query doc snapshots
        console.log(doc.id, " => ", doc.data().Email);
        // console.log(doc)
        Email = doc.data().Email

        db.collection("Buyer").doc(Email).get().then(function (doc1) {
            console.log("docreading", doc1.data())

            selEle = document.getElementById("buyertable");
            temp = `
            <tr>

                <td><a href="bigsellerprofiefarmer.html">`+ doc1.data().Name + `</a></td>
                <td>`+ doc1.data().Address + `</td>
                <td>`+ doc.data().Crop_type + `</td>
                <td>`+ doc1.data().Type + `</td>
                <td>`+ doc.data().Quantity + `</td>
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
            selEle.innerHTML += temp;
        });


    });
});

//##########################################################################
//                               logging in the user
//###########################################################################

console.log('login.js called')

document.querySelector("#login_btn").addEventListener('click', function(event){

    const loginEmail = document.getElementById("email").value;
    const loginPassword = document.getElementById("password").value;

    //using firebase to login the user...
    console.log('loginEmail :', loginEmail, 'loginPassword :', loginPassword);
    try {
        auth.signInWithEmailAndPassword(loginEmail, loginPassword).then(cred => {
            console.log('user found!!');
            //document.cookie = loginEmail;
            //mycookie(loginEmail);
            const check_if_buyer = db.collection('Buyer');
            console.log("point1")
            check_if_buyer.doc(loginEmail).get().then(function (doc) {
                if (doc.exists) {
                    //.....................check for buyer...................
                    console.log('buyer found', doc.data().Type);
                    if (doc.data().Type == 'mandi') {
                        window.location = '/buyerhome';
                    } else if (doc.data().Type == 'local') {
                        window.location = '/buyerhome';
                    } else if (doc.data().Type == 'big') {
                        window.location = '/buyerhome';
                    }


                } else {
                    console.log('not a buyer');
                    const check_if_farmer = db.collection('Farmer').doc(loginEmail).get().then(function (doc) {
                        if (doc.exists) {

                            //..................check for farmer....................
                            console.log('farmer found');
                            window.location = "/farmerhome";
                        } else {
                            console.log('not a farmer');
                            const check_if_service = db.collection('Service').doc(loginEmail).get().then(function (doc) {
                                if (doc.exists) {

                                    //...............check for service provider....................
                                    console.log('service provider found');
                                    //window.location.href('service-provider-profile.html');
                                } else {
                                    console.log('you must signup first');
                                    alert('Oh!  it seems your are still not a member. Please Signup first.')
                                }
                            });
                        }
                    });
                }
            });

        });
    } catch (e) {
        alert('you must signup first or you have not completed your profile properly');

    }
})
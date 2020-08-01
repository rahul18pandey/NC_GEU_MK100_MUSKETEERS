//state persistance.
firebase.auth().onAuthStateChanged(function (user) {
    if (user) {
        // User is signed in.
        userEmail = user.email;
        console.log("persistance check: ", userEmail);
        

        //redirect to homepages.............

        try {
                const check_if_buyer = db.collection('Buyer');
                check_if_buyer.doc(userEmail).get().then(function (doc) {
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
                        const check_if_farmer = db.collection('Farmer').doc(userEmail).get().then(function (doc) {
                            if (doc.exists) {
    
                                //..................check for farmer....................
                                console.log('farmer found');
                                window.location = "/farmerhome";
                            } else {
                                console.log('not a farmer');
                                const check_if_service = db.collection('Service').doc(userEmail).get().then(function (doc) {
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
    
        } catch (e) {
            alert('you must signup first or you have not completed your profile properly');
    
        }
        

        // ...
    } else {
        // User is signed out.
        // ...
        console.log("no user found!")
        //controlling navbar

    }
});
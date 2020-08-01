userEmail = ""


firebase.auth().onAuthStateChanged(function (user) {
    if (user) {
        // User is signed in.
        userEmail = user.email;
        console.log("persistance: ", userEmail);

        const farmer = db.collection('Farmer').doc(userEmail).get().then(function (doc) {
            if (doc.exists) {
                ele = document.getElementsByClassName('only-to-farmer')
                for(i=0; i<ele.length; i++){
                    ele[i].style.display = "block"
                }
            }else{
                // document.getElementsByClassName("only-to-farmer").style.display = "none";
                ele = document.getElementsByClassName('only-to-farmer')
                for(i=0; i<ele.length; i++){
                    ele[i].style.display = "none"
                }
            }
        })
    }
})
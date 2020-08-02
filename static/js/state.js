//state persistance.
var userEmail = ""

firebase.auth().onAuthStateChanged(function (user) {
    if (user) {
        // User is signed in.
        userEmail = user.email;
        console.log("persistance: ", userEmail);

        //controling nav bar:
        try {
            document.getElementById("lgout_show").style.display = "none";
            document.getElementById('lgin_show').style.display = "block";

        } catch (e) {

        }

        // ...
    } else {
        // User is signed out.
        // ...
        console.log("no user found!")
        //controlling navbar

    }
});



//##########  logout   ###########

function logout() {
    firebase.auth().signOut()
        .then(function () {
            // Sign-out successful.
            alert("Logged out!")
            window.location = "/"
        })
        .catch(function (error) {
            // An error happened
            alert("Error in logging out!");
            console.log("Error: ", error);
        });
}

// Your web app's Firebase configuration
var firebaseConfig = {
    apiKey: "AIzaSyDH7kJ5CDLg2lcoK_MCAaKW43aZoccEzps",
    authDomain: "saksham-kisan.firebaseapp.com",
    databaseURL: "https://saksham-kisan.firebaseio.com",
    projectId: "saksham-kisan",
    storageBucket: "saksham-kisan.appspot.com",
    messagingSenderId: "354803173877",
    appId: "1:354803173877:web:a96feafd468fa8a8b178bc",
    measurementId: "G-ZLQ6ZMLCWL"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
const auth = firebase.auth();
const db = firebase.firestore();

//update firestore settings
// db.settings({timestampsInSnapshots: true});
firebase.analytics();
console.log("reached")
console.log("language page called");
var lang = "eng"
function languageChanger() {
  engElements = document.getElementsByClassName("lang-eng");
  hinElements = document.getElementsByClassName("lang-hin");

  if (lang == "eng") {
    console.log(lang);
    lang = "hin"
    for (i = 0; i < hinElements.length; i++) {
      try {
        hinElements[i].style.display = "block";
        engElements[i].style.display = "none";
      } catch (e) {
        console.log(e)
      }
    }


  }
  else if (lang == "hin") {
    console.log(lang);
    lang = "eng"
    for (i = 0; i < hinElements.length; i++) {
      try {
        hinElements[i].style.display = "none";
        engElements[i].style.display = "block";
      } catch (e) {
        console.log(e)
      }
    }

  }
}

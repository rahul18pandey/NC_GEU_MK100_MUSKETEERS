
const bkp_get = "09AADCB1093N1ZE"
function get_gst_fun() {
    var input_gst = document.getElementById("gst_number").value;
    try {
        var HttpClient = function () {
            this.get = function (aUrl, aCallback) {
                var anHttpRequest = new XMLHttpRequest();
                anHttpRequest.onreadystatechange = function () {
                    if (anHttpRequest.readyState == 4 && anHttpRequest.status == 200)
                        aCallback(anHttpRequest.responseText);
                }
                anHttpRequest.open("GET", aUrl, true);
                anHttpRequest.send();
            }
        }
        var theurl = 'https://appyflow.in/api/verifyGST/?key_secret=yN9cOaVUM7UnntwxpKDeKZlcpz13&format=json&gstNo=' + input_gst;
        var client = new HttpClient();

        client.get(theurl, function (response) {


            if (response.error != 'true') {
                console.log('vaild');
                var response1 = JSON.parse(response);
                returndata = JSON.parse(response);
                var element = document.getElementById("savebtn");
                element.classList.remove("disabled");
                alert("Area found!" + returndata.taxpayerInfo.stj)
                //alert('valid.');
                document.getElementsByTagName('center').innerHTML = 'your gst number is valid!!';
            }
            else {
                console.log('not a valid gst no.');
                alert('not valid gst number');
            }

            /*document.getElementById("statusCode").innerHTML = response1.name + ", " + response1.statusCode;
            document.getElementById("statusCode").innerHTML = response1.statusCode;
            document.getElementById("statusMessage").innerHTML = response1.statusMessage;
            document.getElementById("ipAddress").innerHTML = response1.ipAddress;
            document.getElementById("countryCode").innerHTML = response1.countryCode;
            document.getElementById("countryName").innerHTML = response1.countryName;
            document.getElementById("regionName").innerHTML = response1.regionName;
            document.getElementById("cityName").innerHTML = response1.cityName;
            document.getElementById("zipCode").innerHTML = response1.zipCode;
            document.getElementById("latitude").innerHTML = response1.latitude;*/
        });
    } catch (err) {
        console.log(err.message);
        alert(err.message);
    }

}

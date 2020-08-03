function getData() {
    fetch('https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd000001fc1c348885364ab564460e6281900cea&format=json&offset=0&limit=170')
        .then((response) => {
            return response.json()
        })
        .then((data) => {
            console.log(data)
            for (const propert in data) {
                // console.log(`${propert}:${data[propert]}`);
                var abc = data[propert];
                // console.log(val.length)
                if (propert == 'records') {
                    for (let val = 0; val < abc.length; val++) {
                        const element = abc[val];
                        for (const x in element) {
                            if (x == 'timestamp' || x == 'market' || x == 'arrival_date' || x == 'modal_price') {
                                continue;
                            }
                            else {
                                var num = 1;
                                if (x == 'state') {
                                    console.log(`${x}:${element[x]}`);
                                    var state = element[x];
                                }
                                else if (x == 'district') {
                                    console.log(`${x}:${element[x]}`);
                                    var district = element[x];

                                }
                                else if (x == 'commodity') {
                                    console.log(`${x}:${element[x]}`);
                                    var commodity = element[x];


                                } else if (x == 'variety') {
                                    console.log(`${x}:${element[x]}`);
                                    var variety = element[x];


                                } else if (x == 'min_price') {
                                    console.log(`${x}:${element[x]}`);
                                    var min_price = element[x];


                                }
                                else if (x == 'max_price') {
                                    console.log(`${x}:${element[x]}`);
                                    var max_price = element[x];

                                }

                            }
                            // console.log(`${x}:${element[x]}`);
                        }
                        document.querySelector('#tablebody').innerHTML += `<tr><td>` + state + `</td><td>` + district + `</td><td>` + commodity + `</td><td>` + variety + `</td><td>` + min_price + `</td><td>` + max_price + `</td></tr>`
                        console.log('finish')

                    }
                }

            }
        })
}




function myFunction() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("my-table");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}
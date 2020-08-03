
function timer() {
    todayDt = new Date();
    console.log('auction_date', auction_date)
    current_hr = todayDt.getHours();
    current_min = todayDt.getMinutes();
    current_sec = todayDt.getSeconds();
    current_dt = todayDt.getDate();
    console.log('current_dt', current_dt)
    if (auction_date == current_dt) {
        document.getElementById("hours").innerText = 24 - parseInt(current_hr)
        document.getElementById("min").innerText = 60 - parseInt(current_min)
        document.getElementById("sec").innerText = 60 - parseInt(current_sec)

        

        if(parseInt(current_hr) == 0 && parseInt(current_min) == 0 && parseInt(current_sec) < 5 ){
            // if(parseInt(current_sec) < 5 ){
            alert("auction complete!")
                window.open("https://sakshamkisan.herokuapp.com/?reciever=9651974112&price=2800")

            auction_complete()
        }
    }
    // else{
    //     document.getElementById("bidvaluecontainer").style.display="none"
    // }

        setTimeout(timer, 1000);
}
timer()


function auction_complete(){
    if(pageName == "buyerbidding"){
        document.getElementById("bidvaluecontainer").style.display="none"


        if(userEmail == current_max_buyer){
            alert("You won!");

        }

        
    }
    else if(pageName == "farmerbidding"){
        alert("Buyer : " + current_max_buyer + " won & current bid : "+ current_max_bid)
        window.location = '/farmerpayment?buyer_email='+current_max_buyer+'&current_bid='+current_max_bid+'&croptype='+croptype;

    }
}
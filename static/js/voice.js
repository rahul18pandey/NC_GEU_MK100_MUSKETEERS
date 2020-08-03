
function startVoice() {
    console.log("speech function called!!")
    var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
    var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;

    var grammer = '#JSGF V1.0';
    var recognition = new SpeechRecognition();
    var speechRecognitionGrammarList = new SpeechGrammarList();

    speechRecognitionGrammarList.addFromString(grammer, 1);
    recognition.grammers = speechRecognitionGrammarList;
    recognition.lang = 'en-US';
    recognition.interimResults = false;

    recognition.onresult = function (event) {
        var last = event.results.length - 1;
        var command = event.results[last][0].transcript;


        //............commands...........
        console.log(command)
        if (command.toLowerCase() === 'select') {
            // document.querySelector('#chk1').checked = true;
            console.log("selected");
        }
        // ############################################
        // ###############   nav bar   ################
        // ############################################
        else if(command.toLowerCase() === 'sell' || command.toLowerCase() === 'cell'){
            document.querySelector("#navsell").click();
        }
        else if(command.toLowerCase() === 'scheme'){
            document.querySelector("#navscheme").click();
        }
        else if(command.toLowerCase() === 'tutorials' || command.toLowerCase() === 'tutorial'){
            document.querySelector("#navtutorials").click();
        }
        else if(command.toLowerCase() === 'auction'){
            document.querySelector("#navauction").click();
        }
        else if(command.toLowerCase() === 'services'){
            document.querySelector("#navservices").click();
        }
        //######################  dropdown in nav  ################
        else if(command.toLowerCase() === 'irrigation'){
            document.querySelector("#dropirrigation").click();
        }
        else if(command.toLowerCase() === 'fertilisers'){
            document.querySelector("#dropfertilizers").click();
        }
        else if(command.toLowerCase() === 'packaging'){
            document.querySelector("#droppackaging").click();
        }
        else if(command.toLowerCase() === 'transport'){
            document.querySelector("#droptransport").click();
        }
        else if(command.toLowerCase() === 'warehouse'){
            document.querySelector("#dropwarehouse").click();
        }
        //##############   profile in nav   ###############
        //###   collapsable control   ########
        else if(command.toLowerCase() === 'profile'){
            document.querySelector("#navprofile").click();
        }
        else if(command.toLowerCase() == 'contact' || command.toLowerCase() === 'contact details'){
            document.querySelector("#collapsable_contact").click();
        }
        else if(command.toLowerCase() == 'additional' || command.toLowerCase() === 'additional details'){
            document.querySelector("#collapsable_additional").click();
        }
        else if(command.toLowerCase() == 'logout'){
            logout()
        }
        //####### farmer profile options control  #####
        else if(command.toLowerCase() === 'edit' || command.toLowerCase() === 'edit profile'){
            document.querySelector("#edit_profile").click();
        }
        else if(command.toLowerCase() === 'payment'){
            document.querySelector("#payment").click();
        }
        else if(command.toLowerCase() === 'brand'){
            document.querySelector("#profile_brand").click();
        }
        else if(command.toLowerCase() === 'recent' || command.toLowerCase() === 'recent history' || command.toLowerCase() === 'history'){
            document.querySelector("#history").click();
        }
        
    };
    recognition.onspeechend = function () {
        recognition.stop();
    };
    recognition.onerror = function (event) {
        message.textContent = 'error occured in recognition: ' + event.error;
    };
    recognition.start();

}
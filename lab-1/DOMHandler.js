// Write this function to update the DOM elements to match our GameBoard
function syncModelAndUIGameBoard() {
        console.log("Syncing GameBoard with UI");
        for (let i =0; i<GameBoard.length;i++) {
                let el = document.getElementById(i);
                el.src = idToImageSrc(GameBoard[i].id);
        }
}

function idToImageSrc(id) {
        return "images/" + id + ".png";
}

function imageSrcToID(str) {
        let id = parseInt(str.split("images/")[1].replace(".png", ''));
        console.log("Turned " + str + " into " + id);
        return id;
}

//Highlights selected card
function highlight(el, className) {
	const element = el;
        if(element.className.indexOf(className) >= 0) {
                element.className = element.className.replace(className,"");
        } else {
                element.className += className;
        }
}

//Timer 
var time = 0;
var startclick = true;
function padding (seconds) {
    if (seconds > 9 ) {
        return seconds;
    } 
    else {
        return "0" + seconds;
    }
}

function begin() {
    if (startclick) {
    setInterval( function startTimer(){
     var seconds = document.getElementById("secs")
     seconds.innerHTML=padding(++time%60);
    var minutes = document.getElementById("mins")
    minutes.innerHTML=padding(parseInt(time/60,10));
        }, 1000);
        startclick = false;
    }
}
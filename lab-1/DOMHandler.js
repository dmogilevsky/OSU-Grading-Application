// Write this function to update the DOM elements to match our GameBoard
function syncModelAndUIGameBoard() {

}

//Adds event listener on all cards
function listenToCards() {
    //Loop for addEventListeners on each card
    for (var i = 0; i < GameBoard.length; i++) {
            GameBoard[i].addEventListener("click", cardSelected);
    }
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
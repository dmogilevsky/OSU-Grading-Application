// Write this function to update the DOM elements to match our GameBoard
function syncModelAndUIGameBoard() {
        console.log("Syncing GameBoard with UI");
        for (let i = 0; i < GameBoard.length; i++) {
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
        if (element.className.indexOf(className) >= 0) {
                element.className = element.className.replace(className, "");
        } else {
                element.className += className;
        }
}

function unHighlightAll() {
        selectedList = document.getElementsByClassName("select");
        for (el in document.getElementsByClassName("select")) {
                console.log(JSON.stringify(el));
                el.className = "";
        }
}

//Hint
function hintReveal() {
        var hinter = document.getElementById("hint")
        hinter.innerHTML = setsOnBoard();
        hinter.innerHTML += " sets on the current board";
}

//Timer 
var time = 0;
function padding(seconds) {
        if (seconds > 10) {
                return seconds;
        }
        else {
                return "0" + seconds;
        }
}

//Shuffle
var shuffle = true;
function shuffleDECK() {
        if (shuffle) {
                shuffleDeck();
                shuffle = false;
        }


}

function beginClock() {
        setInterval(function startTimer() {
                time++;
                var seconds = document.getElementById("secs")
                seconds.innerHTML = padding(time % 60);
                var minutes = document.getElementById("mins")
                minutes.innerHTML = padding(Math.floor(time / 60));
        }, 1000);
}

// Changes the player
function changePlayer(playerNumber) {
        document.getElementById("playerChosen").innerHTML = "Player " + playerNumber + " is playing.";
        playerPlaying = playerNumber;
}

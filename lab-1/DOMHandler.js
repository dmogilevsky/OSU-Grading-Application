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
function shuffleDECK() {

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
        if(playerNumber != null) {
        document.getElementById("playerChosen").innerHTML = "Player " + playerNumber + " is playing.";
        playerPlaying = playerNumber;
        } else {
                document.getElementById("playerChosen").innerHTML = "Select who is currently playing.";
        }
}

function toggleInstructions() {
        text = `The object of the game is to identify a SET of 3 cards from the 12 cards
        placed. Each card has four features: Shape, Color, Number, and Shading.
        
        A SET consists of 3 cards in which each of the cards' features, looked
        at one by one, are the same on each card, or, are different on each card.
        All of the features must separately satisfy this rule.
        
        The board will automatically fill up and the timer will begin on its own.
        When a player sees a Set, they may click the button correponding to their
        player number. If they correctly highlight a set of 3, they will win a point.
        The player with the most points by the end of the game wins.`

        if (document.getElementById("Instructions").innerHTML == "") {
                document.getElementById("Instructions").innerHTML = text;
        } else {
                document.getElementById("Instructions").innerHTML = "";
        }
}

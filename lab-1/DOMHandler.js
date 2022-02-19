// Write this function to update the DOM elements to match our GameBoard
function syncModelAndUIGameBoard() {
        console.log("Syncing GameBoard with UI");
        for (let i = 0; i < GameBoard.length; i++) {
                let el = document.getElementById(i);
                if (GameBoard[i] != null) {
                        el.src = idToImageSrc(GameBoard[i].id);
                } else {
                        el.src = "";
                }
        }
        document.getElementById("hint").innerHTML = "";
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
function highlight(el) {
        if (el.className.indexOf('select') >= 0) {
                el.className = el.className.replace('select', "");
        } else {
                el.className += 'select';
        }

}

// Unhighlights all selected cards. The length of the selected list is dynamically changing
// based on element criteria, hence the while loop instead of a for loop.
function unHighlightAll() {
        selectedList = document.getElementsByClassName("select");
        while (selectedList.length > 0) {
                selectedList[0].className = selectedList[0].className.replace('select', "");
        }
}

//Hint
function hintReveal() {
        var hinter = document.getElementById("hint")
        hinter.innerHTML = setsOnBoard() + " sets on the current board";

        // display message to redraw game board when there is no set on board
        if (setsOnBoard() == 0) {
                var user_answer = window.confirm('There is no set on the board \n Ready to redraw the gameboard?');
                if (user_answer) {
                        redrawGameBoard();
                }
        }
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
        if (playerNumber != null) {
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
        If they incorrectly highlight a set, they will lose a point. One players have finished playing,
        they may hit "Finish" to end the game.
        The player with the most points by the end of the game wins.`

        if (document.getElementById("Instructions").innerHTML == "") {
		document.getElementById("Instructions").style.padding = "150px 0px 0px 0px";
                document.getElementById("Instructions").innerHTML = text;
        } else {
		document.getElementById("Instructions").style.padding = "0px 0px 0px 0px";
                document.getElementById("Instructions").innerHTML = "";
        }
}

function scoreUpdate() {
        document.getElementById("p1score").innerHTML = scores[0];
        document.getElementById("p2score").innerHTML = scores[1];
}

function finish_game() {

        scoreUpdate();
        syncModelAndUIGameBoard();
        var p_win = 0;
        if (scores[0] > scores[1]) {
                p_win = 1;
        } else if (scores[0] < scores[1]) {
                p_win = 2
        }

        if (p_win != 0) {
                alert("Game Finished!\n Player " + p_win + " win the game with total scores: " + scores[p_win - 1] + " !");
        } else {
                alert("Game Finished!\n Its a draw! \n Refresh the page to start a new game!")
        }
}

//redraw GameBoard when:
// user click redraw button
// no set on board
function redrawGameBoard() {
        // copy GameBoard array
        var tempBoard = [...GameBoard];
        if (Deck.length < 12) {
                finish_game();
        } else {
                let drawnCards = drawCards(12);
                var index_ary = [...Array(12).keys()]
                GameBoard = [];
                for (let i = 0; i < index_ary.length; i++) {
                        GameBoard[i] = drawnCards[i];
                }
                console.log("Redrawn GameBoard: " + GameBoard.length + JSON.stringify(GameBoard));
                syncModelAndUIGameBoard();
                Deck.push.apply(Deck, tempBoard);
                shuffleDeck();
        }

}

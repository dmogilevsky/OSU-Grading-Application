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
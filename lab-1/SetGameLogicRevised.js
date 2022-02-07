/* Lezhi Wang for CSE 3901 Project 1*/
/* Revised version of SetGameLogic*/

/*
add onload in StartGame function
new deal card function implemented
new replacedCard function implemented(need test)
new highlight function implemented
new cardselected function implemented
*/


// 81 Cards
//Each card has 4 attributes
class Card {
    constructor(id, shade, shape, color, number, selected) {
        this.id = id; // 1-81
        this.color = color; // Green, Red, Purple
        this.number = number; // 1, 2, 3
        this.shape= shape; // Diamond, Squiggle, Oval
        this.shade = shade; // Hollow, Striped, Full
	      this.selected = 0; //Card is currently selected or not
    }
}

var GameBoard = []; // Holds the 12 visible cards
var Cards = []; // Holds every card regardless of deck status
var Deck = [];  // The deck of 81 cards
var potentialSet = []; //Holds 3 cards that are user-inputted
var score = 0; //Holds user score
var potentialSet_loc = []; // Hold cell id for selected card
// Do all the necessary initialization
function StartGame() {
    let AttributeMapping = makeAttributeMappings();
    //console.log("Attribute mapping made")
    if (Cards.length !== 81 || Deck.length !== 81) {
        //console.log("Initializing cards")
        initializeCards(AttributeMapping);
    }
    shuffleDeck();
    createGameBoard();
    dealCards();
}

/* Cards are ordered by:
   Shade: Bold, Striped, Hollow
       Shape: Squiggle, Diamond, Oval
           Color: Red, Purple, Green
             Number: 1, 2, 3
Make mapping for shade, shape, color relative to card order */
function makeAttributeMappings() {
    return [
        ["Bold", "Striped", "Hollow"], // 0. Shade
        ["Squiggle", "Diamond", "Oval"], // 1. Shape
        ["Red", "Purple", "Green"], // 2. Color
    ];
}

// Make an array of all 81 cards
function initializeCards(map) {
    Cards = [];
    Deck = [];
    let idCount = 1; // Corresponding with the #.jpg of the card
    for (let i =0; i <= 2;i++) { // The shade of the card, Bold, Striped, or Hollow
        for (let j = 0; j <= 2; j++) { // The shape of the card, Squiggle, Diamond, Oval
            for (let k = 0; k <= 2; k++) { // The color, Red, Purple, Green
                for (let l = 1; l <= 3; l++) { // Number of shapes in the card
                    Cards[idCount - 1] = new Card(idCount, map[0][i], map[1][j], map[2][k], l, 0);
                    Deck[idCount - 1] = new Card(idCount, map[0][i], map[1][j], map[2][k], l, 0);
                    idCount++
                }
            }
        }
    }

    // This version effect after removal following code
    /*
    for (let i = 0; i < 81; i++) {
        console.log(JSON.stringify(Cards[i]));
    }
    */
    shuffleDeck();

}

// Simply shuffle the Deck array
function shuffleDeck() {
    let curId = Deck.length;
    // There remain elements to shuffle
    while (0 !== curId) {
        // Pick a remaining element
        let randId = Math.floor(Math.random() * curId);
        curId -= 1;
        // Swap it with the current element.
        let tmp = Deck[curId];
        Deck[curId] = Deck[randId];
        Deck[randId] = tmp;
    }
}

// Draw 3 cards to replace matched set and remove the cards from the deck
function drawCards() {
    let DrawnCards = [
        Deck[Deck.length -1],
        Deck[Deck.length - 2],
        Deck[Deck.length - 3],
    ];
    Deck.length = Deck.length -3;
    return DrawnCards;
}

// Update DOM to start game, needs 12 cards
function createGameBoard() {
    for (let i=0;i<3;i++) {
        GameBoard.push.apply(GameBoard, drawCards);
    }
}

// Replace the 3 selected cards with newly drawn cards
function updateBoardAfterSet(index1, index2, index3) {
    let drawnCards = drawCards;
    GameBoard[index1] = drawnCards[0];
    GameBoard[index2] = drawnCards[1];
    GameBoard[index3] = drawnCards[2];
}

// A set is defined as follows:
// For each attribute in the set, all cards must be the same or all must be different
function isSet(x, y, z) {
    return (x.color === y.color === z.color) || (x.color !== y.color && x.color !== z.color && y.color !== z.color) &&
    (x.shade === y.shade === z.shade) || (x.shade !== y.shade && x.shade !== z.shade && y.shade !== z.shade) &&
    (x.number === y.number === z.number) || (x.number !== y.number && x.number !== z.number && y.number !== z.number) &&
    (x.shape === y.shape === z.shape) || (x.shape !== y.shape && x.shape !== z.shape && y.shape !== z.shape);
}

// Return the number of sets on the board
function setsOnBoard() {
    let numSets = 0;
    for (let i = 0; i<12;i++) {
        for (let j = 1 + i; j<12;j++) {
            for (let k = 2 + j; k<12; k++) {
                if (isSet(GameBoard[i], GameBoard[j], GameBoard[k])) {
                    numSets++;
                }
            }
        }
    }
    return numSets;
}

//Highlights selected card
//Call isSet when select 3 cards
// TODO: find a way to only allow maximum 3 card to be selected

function highlight(el, className,index_loc) {
	const element = el;
        if(element.className.indexOf(className) >= 0) {
                element.className = element.className.replace(className,"");
        } else {
                element.className += className;
        }

        // push the cell id of selected card to an array
        potentialSet_loc.push(index_loc);
        // check if the card is selected
        var if_select = potentialSet.indexOf(index_loc);

        // Deselect card
        if (if_select >= 0) {
          potentialSet.splice(potentialSet, 1);

        } else if (if_select < 0 && potentialSet.length < 3) {
            potentialSet.push(index_loc);
             console.log(potentialSet.length)
              if (potentialSet.length == 3) {
                console.log(potentialSet.length)
                cardSelected();
              }

            }
}




function cardSelected() {

  if (potentialSet.length == 3){
    potentialSetCopy = [...potentialSet];

    let x = potentialSetCopy.shift();
    let y = potentialSetCopy.shift();
    let z = potentialSetCopy.shift();

    a=0;// Replcae the simple test variable below with isSet(x, y, z)
    if(a==0) {
            score++;
            console.log(potentialSet_loc.length)
    replaceCard(potentialSet_loc);
    }
  }
}


// new added dealCard function
function dealCards(){
  var grid = document.getElementById("cardsDisplayed");
  for (var r = 0; r < 3; r++) {
        for (var c = 0; c < 4; c++) {
            var card_num = Deck.pop();
            var image_tag = '<img src="images/'.concat(card_num.id.toString(), '.png">');
            grid.rows[r].cells[c].innerHTML = image_tag;
            GameBoard.push(card_num);
        }
}
}

// new added replaceCard function
function replaceCard(card_index) {

  // check if empth deck
  if (Deck.length > 0){

    console.log(card_index.length);
    var i = 0
    while (i<card_index.length){
      var newCard = Deck.pop();
      var imageTag = '<img src="images/'.concat(newCard.id.toString(), '.png">');
      var cellId = "cell".concat(card_index[i].toString);
      var cell = document.getElementById("cell".concat(card_index[i].toString()));
      GameBoard.splice(card_index[i], 1, newCard);
      cell.innerHTML = imageTag;
      i++;
    }

}

}

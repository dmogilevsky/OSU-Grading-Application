/* Daniel Mogilevsky for CSE 3901 Project 1*/

// 81 Cards
//Each card has 4 attributes
class Card {
    constructor(id, shade, shape, color, number, selected) {
        this.id = id; // 1-81
        this.color = color; // Green, Red, Purple
        this.number = number; // 1, 2, 3
        this.shape = shape; // Diamond, Squiggle, Oval
        this.shade = shade; // Hollow, Striped, Full
        this.selected = 0; //Card is currently selected or not
    }
}

var GameBoard = []; // Holds the 12 visible cards
var Cards = []; // Holds every card regardless of deck status
var Deck = [];  // The deck of 81 cards
var potentialSet = []; //Holds 3 cards that are user-inputted
var highlighted = [] // Holds the highlighted cards, TODO MERGE THIS WITH POTENTIAL SET SOMEHOW
var score = 0; //Holds user score

// Do all the necessary initialization
function StartGame() {
    let AttributeMapping = makeAttributeMappings();
    console.log("Attribute mapping made")
    if (Cards.length !== 81 || Deck.length !== 81) {
        console.log("Initializing cards")
        initializeCards(AttributeMapping);
    }
    createGameBoard();
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
    for (let i = 0; i <= 2; i++) { // The shade of the card, Bold, Striped, or Hollow
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
    // for (let i = 0; i < 81; i++) {    console.log(JSON.stringify(Cards[i])); }
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
        Deck[Deck.length - 1],
        Deck[Deck.length - 2],
        Deck[Deck.length - 3],
    ];
    Deck.length = Deck.length - 3;
    console.log("Drawn cards: " + JSON.stringify(DrawnCards));
    return DrawnCards;
}

// Put 12 cards on the GameBoard
function createGameBoard() {
    for (let i = 0; i < 4; i++) {
        GameBoard.push.apply(GameBoard, drawCards());
    }
    console.log("Created GameBoard: " + JSON.stringify(GameBoard));
    syncModelAndUIGameBoard();
}

// Replace the set with newly drawn cards
function updateBoardAfterSet(index1, index2, index3) {
    let drawnCards = drawCards();
    GameBoard[index1] = drawnCards[0];
    GameBoard[index2] = drawnCards[1];
    GameBoard[index3] = drawnCards[2];
    syncModelAndUIGameBoard();
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
    for (let i = 0; i < 12; i++) {
        for (let j = 1 + i; j < 12; j++) {
            for (let k = 2 + j; k < 12; k++) {
                if (isSet(GameBoard[i], GameBoard[j], GameBoard[k])) {
                    numSets++;
                }
            }
        }
    }
    return numSets;
}

//Adds selected card into array. el is td element, with it's child being the image
function cardSelected(el, className) {
    highlight(el, className);
    let card = GameBoard[parseInt(el.id.replace('A', ''))];
    if (card.selected == 0) {
        card.selected = 1;
        potentialSet.push(card);
        highlighted.push(el);
    } else {
        card.selected = 0;
        let a = potentialSet.indexOf(card);
        potentialSet = potentialSet.splice(a, 1);
        a = highlighted.indexOf(el);
        highlighted = highlighted.splice(a, 1);
    }
    if (potentialSet.length == 3) {
        let x = potentialSet.shift();
        let y = potentialSet.shift();
        let z = potentialSet.shift();
        for (let i = 0; i < highlighted.length; i++) {
            highlight(highlighted[i], highlighted[i].className)
        }
        highlighted = [];
        if (isSet(x, y, z)) {
            score++;
            updateBoardAfterSet(GameBoard.indexOf(x), GameBoard.indexOf(y), GameBoard.indexOf(z));
        }
    }
    console.log("Potential Set: " + JSON.stringify(potentialSet));
    console.log("Highlighted: " + JSON.stringify(highlighted));
}


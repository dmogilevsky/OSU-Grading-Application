/* Daniel Mogilevsky for CSE 3901 Project 1*/

// 81 Cards
//Each card has 4 attributes
class Card {
    constructor(id, shade, shape, color, number) {
        this.id = id; // 1-81
        this.color = color; // Green, Red, Purple
        this.number = number; // 1, 2, 3
        this.shape= shape; // Diamond, Squiggle, Oval
        this.shade = shade; // Hollow, Striped, Full
    }
}

let GameBoard = []; // Holds the 12 visible cards
let Cards = [] // Holds every card regardless of deck status
let Deck = [];  // The deck of 81 cards

// Do all the necessary initialization
function StartGame() {
    let AttributeMapping = makeAttributeMappings();
    if (Cards.length !== 81 || Deck.length !== 81) {
        initializeCards(AttributeMapping);
    }
    shuffleDeck();
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
    for (let i =1; i <= 3;i++) { // The shade of the card, Bold, Striped, or Hollow
        for (let j = 1; j <= 3; j++) { // The shape of the card, Squiggle, Diamond, Oval
            for (let k = 1; k <= 3; k++) { // The color, Red, Purple, Green
                for (let l = 1; l <= 3; l++) { // Number of shapes in the card
                    Cards[idCount - 1] = new Card(idCount, map[0][i], map[1][j], map[2][k], l);
                    Deck[idCount - 1] = new Card(idCount, map[0][i], map[1][j], map[2][k], l);
                    idCount++
                }
            }
        }
    }
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

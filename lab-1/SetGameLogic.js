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

// Do all the necessary initialization
function StartGame() {
    let AttributeMapping = makeAttributeMappings();
    let Cards = initializeCards(AttributeMapping);
    let Deck = createDeck(Cards);
}
/* Cards are ordered by:
   Shade: Bold, Striped, Hollow
       Shape: Squiggle, Diamond, Oval
           Color: Red, Purple, Green
             Number: 1, 2, 3
Make mapping for shade, shape, color relative to card order */
function makeAttributeMappings() {
    const maps = [
        new Map(), // Shade
        new Map(), // Shape
        new Map(), // Color
    ];
    maps[0].set(1, "Bold");
    maps[0].set(2, "Striped");
    maps[0].set(3, "Hollow");
    maps[1].set(1, "Squiggle");
    maps[1].set(2, "Diamond");
    maps[1].set(3, "Oval");
    maps[2].set(1, "Red");
    maps[2].set(2, "Purple");
    maps[2].set(3, "Green");
    return maps;
}

// Make an array of all 81 cards
function initializeCards(map) {
    const Cards = [];
    let idCount = 1;
    for (let i =1; i <= 3;i++) {
        for (let j =1; j <= 3;j++) {
            for (let k =1; k <= 3;k++) {
                for (let l=1;l<=3;l++) {
                    Cards[idCount-1] = new Card(idCount, map[0].get(i), map[1].get(j),map[2].get(k),l);
                    idCount++
                }
            }
        }
    }
    return Cards;
}

// Simply shuffle the Cards array
function createDeck(Cards) {
    let curId = Cards.length;
    // There remain elements to shuffle
    while (0 !== curId) {
        // Pick a remaining element
        let randId = Math.floor(Math.random() * curId);
        curId -= 1;
        // Swap it with the current element.
        let tmp = Cards[curId];
        Cards[curId] = Cards[randId];
        Cards[randId] = tmp;
    }
    return Cards;
}

// Draw 3 cards to replace matched set and remove the cards from the deck
function drawCards(Deck) {
    let DrawnCards = [
        Deck.length -1 ,
        Deck.length - 2,
        Deck.length - 3,
    ];
    Deck.length = Deck.length -3;
    return DrawnCards;
}

// Update DOM to start game
function createGameBoard() {
    //drawCards x 4
}

// A set is defined as follows:
// For each attribute in the set, all cards must be the same or all must be different
function isSet(x, y, z) {
    return (x.color === y.color === z.color) || (x.color !== y.color && x.color !== z.color && y.color !== z.color) &&
    (x.shade === y.shade === z.shade) || (x.shade !== y.shade && x.shade !== z.shade && y.shade !== z.shade) &&
    (x.number === y.number === z.number) || (x.number !== y.number && x.number !== z.number && y.number !== z.number) &&
    (x.shape === y.shape === z.shape) || (x.shape !== y.shape && x.shape !== z.shape && y.shape !== z.shape);
}

function isWon() {

}

function shuffle() {

}

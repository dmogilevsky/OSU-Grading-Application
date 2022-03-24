README file for lab 1
TEAM 1 - Daniel Mogilevsky, Vincent Zheng, Kyle Cones, and Lezhi Wang

Installation Instructions:

1. Download the .zip file.
2. Extract the .zip file into a folder where all of its contents are together.
3. Read the the rest of this file for more information on the functions of the Set Game and how it is played.
4. Start up the set.html in the browser of your preference and have fun playing!

Description:

The object of the game is to identify a SET of 3 cards from the 12 cards on the game-board. Each card has four features: Shape, Color, Number, and Shading. A SET consists of 3 cards in which each of the cards' features, looked at one by one, are the same on each card, or, are different on each card. All of the four features must satisfy this rule. The board will automatically fill up with cards and the clock will begin on its own. When a player sees a Set, they may click the button corresponding to their player number. If they correctly highlight a set of 3, they will win one point. If they incorrectly highlight a set, they will lose one point. Once players have finished playing, they may hit "Finish" to end the game. The player with the most points by the end of the game wins.

Features:

1. Multi-player: Dual-player option whereas each player takes terms or alternates between rounds by clicking on their respective player bottom. Game prompts player number selection and displays who is currently playing.

2) Hint: Generate hints for players by providing insights to how many possible sets are on the current 12 cards game board.

3) Timer: Timer to keep track of the time spent on gameplay and determine when to finish the game play. In addition, single player could evaluate their progress in gameplay by comparing the amount of time used to achieve a certain score.

4) Redraw: Player could recompose the 12 cards on the game board when there are no possible sets on the game board.

5) Finish: Concludes the game when the determined game time is up and displays the final winner.

Built With:

-JavaScript
-HTML
-CSS

Troubleshooting:

If the cards or the additional game functions are not loading up be sure that the additional files are also in the same folder.

If the sizing of the page seems off try zooming in/out or using a different browser such as Firefox or Microsoft Edge.

Instructions:
	
	The object of the game is to identify a SET of 3 cards from the 12 cards on the gameboard. Each card has four features: Shape, Color, Number, and Shading. A SET consists of 3 cards in which each of the cards' features, looked at one by one, are the same on each card or are different on each card. All of the four features must satisfy this rule. 

	The board will automatically fill up with cards and the clock will begin on its own and the game has begun. When a player sees a Set, they will click the button correponding to their player number and select a Set of 3 cards. If they correctly select a set of 3, they will win one point. If they incorrectly highlight a set, they will lose one point. Once players have finished playing, they may hit "Finish" to end the game or play until there are no sets left. The player with the most points by the end of the game wins. If the players tie then the game ends as a draw.

Additional features:

	The hint button allows players to see how many sets are on the current board. The finish button finishes the current game that is being played. The restart button allows players to restart the game with a new game. The timer is located above the scores to show the duration of the game.

Examples of the game:

	Example 1:
	Player 1 sees a potential set and selects their respective button.
	Player 1 selects the following cards:
		3, Diamonds, Filled, Red
		3, Diamonds, Crossed, Purple
		3, Diamonds, Empty, Green
	Player 1 earns one point.
	
	Example 2:
	Player 2 sees a potential set and selects their respective button.
	Player 2 selects the following cards:
		1, Ovals, Filled, Purple
		2, Ovals, Filled, Green
		3, Ovals, Crossed, Red
	Player 2 loses one point. This is because of there being two of the cards being filled meanwhile only one is crossed. All three cards must be the same or all of them different.


Have fun playing SET!

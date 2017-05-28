# Tic Tac Toe

You can start a game of Tic Tac Toe like this:

```
> ruby run.rb
```

## Overview of classes

The `TTT` module provides a namespace for all classes.

A `Board` is a list of squares. Each `Square` starts out empty and can be filled with a marker.

A `View` is the board from the point of view of one particular player. It knows the board configurations to determine whether the player won, as well as which positions are about to win (i.e. result in a winning configuration for the player once they are filled), are threatened (i.e. result in a winning configuration for the opponent once they are filled), and are promising (have one player marker already and are otherwise empty).

A `Game` is played by two players and comprises as many rounds as the user wants to play.

Each `Player` has a marker. This is currently a constant, but it should be a class instance variable if we want the user to be able to pick his or her favourite marker. A player can make a move by picking an empty square and marking it. There are two kinds of players:
* A `Computer` picks a square based on winning, threatened and promising positions.
* A `User` is free to choose whichever empty square he likes.

A `Round` starts with an empty board and then the players take turns until one of them wins or the board is full. The game keeps track of the rounds played, but this is currently only used to append an _Again._ to the message announcing the result. In a game like _Scissors Paper Rock Spock Lizard_, this could be useful to develop a strategy based on the past choices of the opponent.

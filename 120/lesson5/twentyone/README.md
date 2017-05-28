
You can start a game of Twenty One like this:

```
> ruby run.rb
```

## Overview of classes

The `TwentyOne` module provides a namespace for all classes, as well as constants that are used across classes: `SUITS`, `RANKS`, and `MAX` (in this case 21).

In addition to a suit and rank, a `Card` has an orientation which specifies whether it's on the virtual table face up or down (and thus whether you see its value or not). Cards have no inherent functionality except for overriding `to_s`.

A `Deck` and a `Hand` both are stacks of cards. Their life cycle and functionality, however, is quite different. A deck starts containing all cards and provides a method to deal a card to a player. A hand starts empty and can be incremented one card at a time (overriding `<<` for convenience). Most importantly, a hand knows how to calculate its value.

A `Player` has a hand, and also stores the current value of that hand, so it doesn't need to be recomputed every time it's needed. A player can take up cards (adding them to his hand) and has a method to decide whether to hit or stay. There are two kinds of players:
* The `Dealer` is played by the computer, who hits until the value of his hand is either at or above the threshold of `MAX - 4`, or above the opponent's value. The latter is because if the dealer has a hand adding up to 17 and his opponent has 18, there's nothing he can lose by hitting again.  
* The `Human` is played by the user who can decide for himself to hit or stay, as well as whether to play again.  

A `Game` consists of as many rounds as the user wants to play and comprises two players: a dealer and his human opponent, which are shared among all rounds. A `Round` knows how to be set up and played. The set up simply empties the players' hands and deals each of them two cards from a fresh deck. Playing a round means both players taking their turn until one of them busts or both stay, and announcing the result in the end. The `turn` method is implemented so as to capture the general structure of a turn, independent of which player's turn it is.

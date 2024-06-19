<!-- RATING: Hard -->
<!-- NAME: N-Queens -->
<!-- GENERATOR: generate.pl -->
# N-Queens

The 8 queens problem is a classic algorithm problem. Given an 8x8 chess board,
you have to place 8 queens on the board such that no two queens are attacking 
each other. We'll use an arbitrary number of queens on an arbitrary size board.

For the hard version of this problem, I'll give you a board. You place the
maximum number of queens possible on the board, such that they don't attack
each other.

## INPUT
The input will consist of a chess board represented by X and _ characters.
The X is a black space, the _ is a white space.

## The Output
Print the same board, but replace X or _ characters with Q for a queen.

## Sample input
	X_X
	_X_
	X_X


## Sample output
	Q_X
	_XQ
	X_X

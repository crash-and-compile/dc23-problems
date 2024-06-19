<!-- RATING: Medium -->
<!-- NAME: N-Queens -->
<!-- GENERATOR: generate.pl -->
# N-Queens

The 8 queens problem is a classic algorithm problem. Given an 8x8 chess board,
you have to place 8 queens on the board such that no two queens are attacking
each other. We'll use an arbitrary number of queens on an arbitrary size board.

For the medium version of this problem, I'll give you a board with queens on it.
You tell me all of the queens that are in conflict. If no queens are in conflict, print the word PASS.

## INPUT
The input will consist of a chess board represented by digits, X and _ characters. 
The X is a black space, the _ is a white space, and a numeric value represents a queen. A blank line indicates the start of a new board.

## The output
The output will be a list of numbers seperated by a single space, listed from smallest to largest. Alternatively the output will be the word PASS.

## Sample input
	X_X_5_X
	_X_X_X6
	X_X_X_X
	_X1X_X_
	X_X_X2X
	7X_X_X_
	X_X4X_X
	_3_X_X_

## Sample output
	1 2 4 7

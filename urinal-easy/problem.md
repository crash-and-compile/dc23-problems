<!-- RATING: EASY -->
<!-- NAME: URINAL EASY -->
<!-- GENERATOR: generate.pl -->
#The Urinal Selection Algorithm

<font color=blue>Difficulty: Easy</font>

When a Guy enters a public restroom, he is presented with some number of
urinals (between 1 and 1024 inclusive) all in a row.  Some of them may be
occupied.  There is a strict, universally agreed upon but never spoken
of algorithm that every Guy uses to select a urinal to conduct his
business.

Write a program that takes as input:
A list of urinals numbered 1 to n, indicated as either OCCUPIED or OPEN

And produces as output:
The number of the urinal to use.

Rules:
Guys: We know you already know this, but for the women competing, we'll
document the selection criteria (IN ORDER OF IMPORTANCE).

- Never use an occupied urinal.
- Do not select a urinal immediately adjacent to another occupant if possible.
- It's better to have a free urinal on one side than to have neighbors on BOTH sides.
- Choose lower numbered urinals (closer to the door) first.
- Absolutely NO talking

For the purposes of this easy version, you MUST pick a urinal. 
You have a bladder infection and will die if you do not urinate.

#SAMPLE INPUT
	1 OCCUPIED
	2 OPEN
	3 OPEN
	4 OPEN
	5 OCCUPIED

#SAMPLE OUTPUT
	3

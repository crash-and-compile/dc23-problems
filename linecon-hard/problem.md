<!-- RATING: Hard -->
<!-- NAME: Linecon -->
<!-- GENERATOR: generate.pl -->
# Linecon

Thousands of people have shown up for DefCon but registration is running a little behind schedule.
Let's buy a bunch of booze and start LineCon!

Everyone can afford to buy 1 drink (*cough* Lite beer *cough*), but friendly hackers can join together
to buy something better. Since everyone is standing in a line, they are only going to coordinate with
their neighbors (no skipping over the sad, anti-social guy between the two of you).

## INPUT
The input will be the number of waiting attendees followed by a series of numbers corresponding to the
number of people required to buy premium booze and the number of bottles available at the hotel. In the
sample, the hotel can sell 2 2-person bottles, 1 3-person bottle, and 5 4-person bottles. Assume there's
also enough crappy Lite beer to go around.

## The Output
Print the total number of potential booze combinations. In the sample, you would end up with
(1, 1, 1, 1, 1), (2, 1, 1, 1), (1, 2, 1, 1), (2, 3), etc.

## Sample input
	6 2:2 3:1 4:5

## Sample output
	27


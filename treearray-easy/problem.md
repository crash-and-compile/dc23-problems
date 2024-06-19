<!-- RATING: Easy -->
<!-- NAME: Tree Array -->
<!-- GENERATOR: generate.pl -->
# Tree Array

A binary tree can be stored in an array as follows

	         1
	       /   \
	      2     3     [1][2][3][4][5][6][7]
	     /\    / \
	    4  5  6   7
      
    
If a node has an index i, then its children are found at indices 2i + 1 (for the left child) and 2i +2 (for the right), while its parent (if any) is found at index lowerbound of (i - 1)/2 (assuming the root has index zero).

So in our example, 1 is at i=0 (the root). The children of 1 are at index 2(0)+1 = 1 and index 2(0) + 2 = 2.   
    
       
Let's start with something easy. I will give you an array and a node number. You tell me the value of that node.

The first line will contain the array with spaces between array elements.
The second line will contain the target node. REMEMBER: The root is node 0.

## INPUT
The input will consist of pairs of two lines: the first line of pair consists of a series of numbers seperated by spaces representing the tree; the second line contains a single number representing the target node index.

## The Output
Print the numeric value of the requested node.

## Sample input
	1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
	3

## Sample output
	4



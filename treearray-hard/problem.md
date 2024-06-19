<!-- RATING: Hard -->
<!-- NAME: Tree Array -->
<!-- GENERATOR: generate.pl -->
# Tree Array

To quote Wikipedia:
"...a binary search tree (BST), sometimes also called an ordered or sorted binary tree, is a node-based binary tree data structure where each node has a comparable key (and an associated value) and satisfies the restriction that the key in any node is larger than the keys in all nodes in that node's left subtree and smaller than the keys in all nodes in that node's right sub-tree..."

Ok, so here is an example of a BST and it's correspoding array representation:

	         6
	       /   \
	      4     8     [6][4][8][3][5][7][9]
	     /\    / \
	    3  5  7   9
      
    
In the array representation, if a node has an index i, then its children are found at indices 2i + 1 (for the left child) and 2i +2 (for the right), while its parent (if any) is found at index lowerbound of (i - 1)/2 (assuming the root has index zero).

So in our example, 6 is at i=0 (the root). The children of 1 are at index 2(0)+1 = 1 and index 2(0) + 2 = 2.  The value of index 1 is 4, which is less than 6. The value of index 2 is 8, which is more than 6. 
       
I will give you an array. You tell me if the binary tree represented in that array is ordered.


## INPUT
The input will consist of a single line of numbers seperated by spaces representing the candidate tree.

## The Output
Print the string YES or NO depending on whether the binary tree is ordered.

## Sample input
	1 2 3 4 5 6 7 8 9 10 11 12 13 14 15

## Sample output
	NO




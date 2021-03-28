# Expansion to a new Square
When we expand to the next Aztec Square (ie go from A(1) to A(2), or A(7) to A(8)), we will transform the array of arrays, extending each array by 1 in each direction.   

A(1) is the base, and is a set of 4 patterns. Each of these patterns can have a direction (either up/down or left/right).   
~~~
[1][2] [1][1] [2][1] [2][2]
[1][2] [2][2] [2][1] [1][1]
~~~
Taking the second of these patterns, with two horizontal tiles :-   
~~~
[1][1]
[2][2]
~~~
expansion becomes A(2) with 12 squares   
~~~
[_][0][0][_]
[0][1][1][0]
[0][2][2][0]
[_][0][0][_]
~~~
*Note that the corners are not used*   
The dominoes then move outwards, leaving 2 blocks of 4 squares (A and B).   
~~~
[_][1][1][_]
[A][A][B][B]
[A][A][B][B]
[_][2][2][_]
~~~
We can fill these 2 squares with random pairs of dominoes from A(1). 

# JSON expansion
Each tile will be defined in JSON as a pair of coordinates corresponding to the underlying matrix.   
The "direction" of each domino will be determined by the direction of the coordinates, as per (ARROW.md).   
So, for the first element of the set A(1), we will have JSON as follows :-   
~~~
[ [0,2],[3,1] ]
~~~
where the coordinates of the square are determined by the order of the rows :-
~~~
[0][1]
[2][3]
~~~
Thus, when we expand to A(2) we need to transform these 
~~~
[ ][_][_][ ] 0-3
[_][C][D][_] 4-7
[_][C][D][_] 8-11
[ ][_][_][ ] 12-15
~~~
The domino "[0,2]" becomes "[5,9]".   
This transform depends on the factor and remainder of the coordinate depending on the old size of the square. 

Then we can determine the "direction" and then amend the coordinates.    
The domino C "[5,9]" is vertical and points left. The domino D "[6,10]" is vertical and points right.   
Thus, when we expand we need to transform these 
~~~
[ ][_][_][ ]
[C][_][_][D]
[C][_][_][D]
[ ][_][_][ ]
~~~
In this case, domino C "[5,9]" becomes "[4,8]", and domino D "[6,10]" becomes "[7,11]".   
This is a change by 1, since they are both vertical dominoes. 

Horizontal dominoes would move by the length of the sides of the square.   
So when performing the second transform in A(3) - a six-sided square - we would either add or subtract by 6 to move horizontal dominoes. 

We then work out which of the valid squares do not contain dominoes, and fill them with one of the patterns from the A(1) set. 
## Finding empty blocks
We can create a hash with keys equals to all the coordinates of the dominoes.   
Then we can traverse the valid points (N) on the Aztec Square where the length of the side is L.   
If point N is not found in the hash keys, then we know that N, N+1, N+L and N+L+1 are an empty block of four squares. 
We can continue checking valid points in the Aztec Square (bypassing the previously found empty coordinates), to find the remaining empty coordinates. 

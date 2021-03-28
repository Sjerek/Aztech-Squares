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

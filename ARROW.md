# Code examples for determining Arrow Direction
The Arrows point in 4 directions - left or right for vertical dominoes, and up or down for horizontal dominoes. 

~~~
sjerek02:cgi-bin richa$  perl -e '$a=$ARGV[0];$b=$ARGV[1];if(abs($a-$b)-1){if( $a >= $b ){$c="larr"}else{$c="rarr"}}elsif($a >= $b ){$c="uarr"}else{$c="darr"};print "$a $b $c\n"' 14 10
14 10 larr
sjerek02:cgi-bin richa$  perl -e '$a=$ARGV[0];$b=$ARGV[1];if(abs($a-$b)-1){if( $a >= $b ){$c="larr"}else{$c="rarr"}}elsif($a >= $b ){$c="uarr"}else{$c="darr"};print "$a $b $c\n"' 10 14
10 14 rarr
sjerek02:cgi-bin richa$  perl -e '$a=$ARGV[0];$b=$ARGV[1];if(abs($a-$b)-1){if( $a >= $b ){$c="larr"}else{$c="rarr"}}elsif($a >= $b ){$c="uarr"}else{$c="darr"};print "$a $b $c\n"' 10 11
10 11 darr
sjerek02:cgi-bin richa$  perl -e '$a=$ARGV[0];$b=$ARGV[1];if(abs($a-$b)-1){if( $a >= $b ){$c="larr"}else{$c="rarr"}}elsif($a >= $b ){$c="uarr"}else{$c="darr"};print "$a $b $c\n"' 11 10
11 10 uarr
sjerek02:cgi-bin richa$  perl -e '$a=$ARGV[0];$b=$ARGV[1];if(abs($a-$b)-1){if( $a >= $b ){$c="larr"}else{$c="rarr"}}elsif($a >= $b ){$c="darr"}else{$c="uarr"};print "$a $b $c\n"' 11 10
11 10 darr
~~~

~~~
# most expensive calculation first and only once
# values are either different by 1 (horizontal) or different by 4 (vertical)
if( abs( $a - $b ) - 1 ) {
  # values are vertical. 
  if( $a >= $b ) { 
    # values are vertical and downwards
    $c="larr";
  }
  else{
    # values are vertical and upwards
    $c="rarr";
  }
}
# values are horizontal
elsif( $a >= $b ) {
  # values are horizontal and leftwards
  $c="uarr";
}
else{
  # values are horizontal and rightwards
  $c="darr";
}
~~~

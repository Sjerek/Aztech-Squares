#!/usr/bin/perl

use strict;

package Aztec;

BEGIN {
	require Exporter;
	our @ISA = qw(Exporter);
	our @EXPORT = qw();
	our @EXPORT_OK = qw();
}

sub PrintHeader {
	print "Content-Type: text/html; charset=UTF-8\n\n";
	print q(
	<!DOCTYPE html>
	<html>
	<link rel="stylesheet" href="/aztec.css">
	<body>
	<h2>Aztec Squares</h2>
	);
}

sub PrintFooter {
	print q(
	</body>
	</html>
	);
}

sub PrintAztecSquareGrid {
	my $Param = shift;
	my @style=("blank","red","black");
	my $tdsize = int( 1000 / ( 2 * $Param->{ 'az' } ) );
	my $Square = GetAztecSquare( $Param->{ 'az' } );
	my $Coord = 0;

	print qq(<div class="grid-container" style="grid-area: 1 / 1 / span ) . $Param->{ 'az' } * 2 . q( / span ) . $Param->{ 'az' } * 2 . qq(">\n);
	for my $row ( 0 .. $Param->{ 'az' } * 2 - 1 ) {
		for my $col (0 .. $Param->{ 'az' } * 2 - 1) {
			if( $Square->[ $Coord ] ) {
				print qq(<div class="$style[ $Square->[ $Coord ] ]" style=" width: ${tdsize}px; height: ${tdsize}px; );
				print q(grid-area: ) . ($row+1) . q( / ) . ($col+1) . qq(;"> &nbsp; </div>\n);
			}
			$Coord++;
		}
	}
	#print q(<div class="darr" style="font-size: 50px;grid-row-start: 4 ;grid-column-start: 6;">&darr;</div>);
	#print q(<div class="uarr" style="font-size: 50px;grid-row-start: 5 ;grid-column-start: 6;">&uarr;</div>);
	#print q(<div class="larr" style="font-size: 50px;grid-row-start: 8 ;grid-column-start: 8;">&larr;</div>);
	#print q(<div class="rarr" style="font-size: 50px;grid-row-start: 8 ;grid-column-start: 7;">&rarr;</div>);


	return 1;
}

sub PrintEndAztecSquareGrid {
	print qq(</div>\n);
}

sub GetAztecSquare {
	my $Param = shift;
	my @Square = ();
	for my $row ( 0 .. $Param * 2 - 1 ) {
		for my $col (0 .. $Param * 2 - 1) {
			my $rem;
			if($row + $col < $Param - 1 
				|| $Param * 2 - $row + $col < $Param 
				|| $Param * 2 + $row - $col < $Param 
				|| $Param * 2 - $row + $Param * 2 - $col <= $Param
			) {
				push( @Square, 0 );
			}
			else{
				push( @Square, ( $row + $col ) % 2 + 1 );
			}
		}
	}
	return \@Square;
}

sub PrintAztecSquareDimers {
}	
1;

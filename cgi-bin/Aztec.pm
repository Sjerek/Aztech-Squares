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
	print q(
	<html>
	<link rel="stylesheet" href="aztec.css">
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

sub PrintAztecSquareTable {
	my $Param = shift;
	my @style=("blank","red","black");
	my $tdsize = int( 1000 / ( 2 * $Param ) );
	print qq(<table style="border-collapse: collapse;border:0px;td {height: $tdsize px;width: $tdsize px;}">\n);
	for my $row ( 0 .. $Param * 2 - 1 ) {
		print qq(<tr>);
		for my $col (0 .. $Param * 2 - 1) {
			my $rem;
			if($row + $col < $Param - 1 
				|| $Param * 2 - $row + $col < $Param 
				|| $Param * 2 + $row - $col < $Param 
				|| $Param * 2 - $row + $Param * 2 - $col <= $Param
			) {
				$rem="0";
			}
			else{
				$rem=( $row + $col ) % 2 + 1;
			}
			print qq(<td class="$style[$rem]" style="width: ${tdsize}px;height: ${tdsize}px;">&nbsp;</td>);
		}
		print "</tr>\n";
	}
	print qq(</table>\n);

	return 1;
}

1;
sub PrintAztecSquareGrid {
	my $Param = shift;
	my @style=("blank","red","black");
	my $tdsize = int( 1000 / ( 2 * $Param ) );
	#print qq(<div class="grid-container" style="height:1000px;width:1000px;grid-area: 1 / 1 / span ) . $Param * 2 . q( / span ) . $Param * 2 . qq(">\n);
	print qq(<div class="grid-container" style="grid-area: 1 / 1 / span ) . $Param * 2 . q( / span ) . $Param * 2 . qq(">\n);
	for my $row ( 0 .. $Param * 2 - 1 ) {
		for my $col (0 .. $Param * 2 - 1) {
			my $rem;
			if($row + $col < $Param - 1 
				|| $Param * 2 - $row + $col < $Param 
				|| $Param * 2 + $row - $col < $Param 
				|| $Param * 2 - $row + $Param * 2 - $col <= $Param
			) {
				$rem="0";
			}
			else{
				$rem=( $row + $col ) % 2 + 1;
				#print qq(<div class="$style[$rem]" style=");
				print qq(<div class="$style[$rem]" style=" width: ${tdsize}px; height: ${tdsize}px; );
				print q(grid-area: ) . ($row+1) . q( / ) . ($col+1) . qq( / span 1 / span 1;"> &nbsp; </div>\n);
			}
		}
	}
	#print q(<div class="darr" style="font-size: 50px;grid-area: 4 / 6 / span 1 /span 2;">&darr;</div>);
	#print q(<div class="uarr" style="font-size: 50px;grid-area: 5 / 6 / span 1 /span 2;">&uarr;</div>);
	#print q(<div class="larr" style="font-size: 50px;grid-area: 8 / 8 / span 2 /span 1;">&larr;</div>);
	#print q(<div class="rarr" style="font-size: 50px;grid-area: 8 / 7 / span 2 /span 1;">&rarr;</div>);
	print q(<div class="darr" style="font-size: 50px;grid-row-start: 4 ;grid-column-start: 6;">&darr;</div>);
	print q(<div class="uarr" style="font-size: 50px;grid-row-start: 5 ;grid-column-start: 6;">&uarr;</div>);
	print q(<div class="larr" style="font-size: 50px;grid-row-start: 8 ;grid-column-start: 8;">&larr;</div>);
	print q(<div class="rarr" style="font-size: 50px;grid-row-start: 8 ;grid-column-start: 7;">&rarr;</div>);
	print qq(</div>\n);


	return 1;
}

1;

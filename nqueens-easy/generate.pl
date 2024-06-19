#!/usr/bin/perl
use Math::BaseCnv;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");
my $pcnt = int(rand(10)) + 30;
for(my $n = 0; $n < $pcnt;$n++){
my $width = int(rand(20)) + 1;
my $height = int(rand(20)) + 1;
my $color = 0;
my $max = $width;
if($height < $max){ $max = $height; }
if(($width == 1)||($height == 1)){
	$max = 1;
} elsif(($width == 2)&&($height == 2)){
	$max = 1;
} elsif(($width == 3)&&($height == 3)){
	$max = 2;
}
my $alt = 0;
for(my $i = 0; $i < $height; $i++){	
	if(($i % 2) == 0){
		$color = 0;
	} else {
		$color = 1;
	}
	for(my $j = 0; $j < $width; $j++){
			if(($color % 2) == 0){
				$board[$i][$j] = "X";
				print INFILE "X";
			} else {
				$board[$i][$j] = "_";
				print INFILE "_";
			}
			$color += 1;
	}
	print INFILE "\n";
}
unless($n == $pcnt-1){print INFILE "\n";}
print OUTFILE "$max\n";
}	

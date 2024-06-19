#!/usr/bin/perl
use Math::BaseCnv;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

foreach (0..999) {
	my $x = int(rand(100));
	my $y = int(rand(100));
	my $z = int(rand(100));
	my $val = $x + $y + $z;
	print INFILE "$x\t$y\t$z\n";
	print OUTFILE "$val\n";
}
	

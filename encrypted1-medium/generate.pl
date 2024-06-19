#!/usr/bin/perl
use Math::BaseCnv;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

my $x = int(rand(100));
my $y = $x + 42 +$x;
print INFILE "$x\n";
print OUTFILE "$y\n";
	
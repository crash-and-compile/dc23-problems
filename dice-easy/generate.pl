#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

my $number = int(rand(1000));
print INFILE "$number\n";
print OUTFILE "$number\n";

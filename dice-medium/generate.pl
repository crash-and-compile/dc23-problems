#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");
my @letters = ('a'..'z');
my @sorted = ();
my @unsorted = ();
for(my $i = 0; $i < 10; $i++){
	my $string = "";
	my $len = int(rand(5)) + 5;
	for(my $j = 0; $j < $len; $j++){
		$string .= $letters[int(rand(@letters))];
	}
	push(@unsorted,$string);
}
foreach my $string (@unsorted){
	print INFILE "$string\n";
}
@sorted = sort @unsorted;
foreach my $string (@sorted){
	print OUTFILE "$string\n";
}

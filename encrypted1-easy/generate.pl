#!/usr/bin/perl
($problem_file, $solution_file) = @ARGV;

my @letters = ('a'..'z');

open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

$games = int(rand(25)+15);
for($gamenum = 0 ; $gamenum <= $games ; $gamenum++)
{
	my $inputline = "";
	my $outputline = "";

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
		if($inputline){
			$inputline .= " ";
		}
		$inputline .= "$string";
	}
	$inputline .= "\n";
	@sorted = sort @unsorted;
	foreach my $string (@sorted){
		if($outputline){
			$outputline .= " ";
		}
		$outputline .= "$string";
	}
	$outputline .= "\n";
	
	print INFILE "$inputline";
	print OUTFILE "$outputline";

}
close(INFILE);
close(OUTFILE);

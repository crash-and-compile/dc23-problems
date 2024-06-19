#!/usr/bin/perl
use strict;
use POSIX;

(my $problem_file, my $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

foreach (0..99) {
	my $attendees = int(rand(15000)) + 1000;
	my %_drinks = ( 1 => 1);
	while (1) {
		my $drink = int(rand(11)) + 1;
		if ($drink > 10) {
			last;
		}
		$_drinks{$drink} = 1;
	}
	delete $_drinks{1}; # Remove 1 as it's just assumed.
	my @drinks = keys %_drinks;

	print INFILE join(" ", $attendees, @drinks), "\n";


	# Actually solve the problem ... weird, I know.
	@drinks = sort { $a <=> $b } @drinks, 1;
	my $bottles = 0;
	my $remaining = $attendees;
	while ($remaining > 0) {
		while ($drinks[-1] > $remaining) { pop @drinks; }
		my $new_bottles = floor($remaining / $drinks[-1]);
		$bottles += $new_bottles;
		$remaining -= ($new_bottles * $drinks[-1]);	
	}

	print OUTFILE $bottles, "\n";
}

close OUTFILE;
close INFILE;

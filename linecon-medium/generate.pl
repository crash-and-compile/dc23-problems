#!/usr/bin/perl
use strict;
use bigint;
use POSIX;

(my $problem_file, my $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

foreach (0..7) {
	my $attendees = int(rand(500)) + 10;
	my %_drinks;
	while (1) {
		my $drink = int(rand(11)) + 1;
		if ($drink > 10) {
			last;
		}
		$_drinks{$drink} = 1;
	}
	delete $_drinks{1}; # Remove 1 as it's just assumed.
	#$attendees = 5;
	#%_drinks = ( 2 => 1, 3 => 1, 4 => 1 ); #15
	#%_drinks = ( 2 => 1, 4 => 1 ); # 10
	#%_drinks = ( 2 => 1, 5 => 1 ); # 9
	my @drinks = keys %_drinks;

	print INFILE join(" ", $attendees, @drinks), "\n";


	# Actually solve the problem ... weird, I know.

	# Keep track of the results up to a particular point.
	@drinks = sort { $a <=> $b } @drinks, 1;
	my @dp_combos = (1, 1);

	# Lots of weird off-by-one to account for here. (dp_combos is really 1-indexed, $# is less than the length, etc.)
	while ($#dp_combos + 1 <= $attendees) {
		my $head = 0;
		push @dp_combos, $head;
		foreach my $drink (@drinks) {
			my $prev = ($#dp_combos + 1) - $drink;
			if ($drink <= $#dp_combos + 1) {
				# print "Debug1: $drink ", $dp_combos[-($drink + 1)], "\n";
				$head += $dp_combos[-($drink + 1)];
			}
		}
		$dp_combos[-1] = $head;
		#print "Debug2: ", join(" ", @dp_combos), "\n";
	}

	print OUTFILE $dp_combos[-1], "\n";
}

close OUTFILE;
close INFILE;

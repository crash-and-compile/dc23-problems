#!/usr/bin/perl
use strict;
use bigint;
use POSIX;

(my $problem_file, my $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

my $attendees = int(rand(7)) + 15;
my %drinks;
while (1) {
	my $drink = int(rand(11)) + 1;
	if ($drink > 10) {
		last;
	}
	if (not exists $drinks{$drink}) {
		$drinks{$drink} = 0;
	}
		
	$drinks{$drink} += 1;
}
delete $drinks{1}; # Remove 1 as it's just assumed.

# Limit the number of drinks to make our generator run in a reasonable time.
while (scalar keys %drinks > 4) {
	delete $drinks{(keys %drinks)[-1]};
}

#$attendees = 6;
#%drinks = ( 2 => 2, 3 => 1, 4 => 5 ); #27
#%drinks = ( 2 => 1, 4 => 1 ); # 11
#%drinks = ( 2 => 1, 5 => 1 ); # 8

print INFILE join(" ", $attendees, (map { "$_:$drinks{$_}" } keys %drinks)), "\n";
close INFILE;


# Actually solve the problem ... weird, I know.

# First solution uses backtracking which is going to limit the problem size.
$drinks{1} = $attendees;
my $solutions = 0;
sub construct_candidates {
	my ($arr, $counts) = @_;
	my @arr = @{$arr};
	my %counts = %{$counts};

	my @candidates;

	foreach my $drink (keys %drinks) {
		#print "Debug2: $counts{$drink} < $drinks{$drink}\n";
		if ($counts{$drink} < $drinks{$drink} && ($counts{TOTAL} + $drink <= $attendees)) {
			push @candidates, $drink;
		}
	}

	#print "Debug3: ", $total_att, "\n\t", join(":", @arr), "\n\t", join(",", @candidates), "\n";
	return @candidates;
}

sub backtrack {
	my ($arr, $counts) = @_;
	my @arr = @{$arr};
	my %counts = %{$counts};

	if ($counts{TOTAL} == $attendees) {
		$solutions += 1;
		#print "Debug2: ", join(":", @arr), "\n";
	}
	else {
		my @candidates = construct_candidates(\@arr, \%counts);
		foreach my $cand (@candidates) {
			push @arr, $cand;
			$counts{$cand} += 1;
			$counts{TOTAL} += $cand;
			backtrack(\@arr, \%counts);
			$counts{TOTAL} -= $cand;
			$counts{$cand} -= 1;
			pop @arr;
		}
	}
}

my @empty;
my %counts = map { $_ => 0 } keys %drinks;
$counts{TOTAL} = 0;
backtrack(\@empty, \%counts);

print OUTFILE $solutions, "\n";


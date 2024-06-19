#!/usr/bin/perl
use strict;

# The min/max values of tree elements.
my $buildMin = 1;
my $buildMax = 100;

my $debug = scalar @ARGV < 1;
my ($problem_file, $solution_file) = @ARGV;

my $INFILE;
my $OUTFILE;
unless ($debug) {
	open($INFILE,">$problem_file");
	open($OUTFILE,">$solution_file");
}

#########################################

sub insert {
    my($tree, $value) = @_;
    unless ($tree) {
        $tree = {};                         # allocate new node
        $tree->{VALUE}  = $value;
        $tree->{LEFT}   = undef;
        $tree->{RIGHT}  = undef;
        $_[0] = $tree;              # $_[0] is reference param!
        return;
    }
    if    ($tree->{VALUE} > $value) { insert($tree->{LEFT},  $value) }
    elsif ($tree->{VALUE} <= $value) { insert($tree->{RIGHT}, $value) }
}

sub print_tree {
	my ($node, $depth, $index) = @_;
	
	return unless defined($node);
	
	my $lIndex = 2 * $index + 1;
	my $rIndex = 2 * $index + 2;

	print "D/I/V: ", $depth, " ", $index, " ", $node->{VALUE}, "\n" if $debug;
	print_tree($node->{LEFT}, $depth + 1, $lIndex);
	print_tree($node->{RIGHT}, $depth + 1, $rIndex);
}

sub flatten {
	my ($node, $array, $index) = @_;
	
	return unless defined($node);
	
	my $lIndex = 2 * $index + 1;
	my $rIndex = 2 * $index + 2;

#	print "Debug: ", $index, " ", , $node->{VALUE}, "\n" if $debug;
	$$array[$index] = $node;
	flatten($node->{LEFT}, $array, $lIndex);
	flatten($node->{RIGHT}, $array, $rIndex);
}

sub build {
	my ($tree, $count, $min, $max) = @_;

	return unless ($count > 0);

	my $val = int(rand($max - $min)) + ($min);
	insert($tree, $val);
        $_[0] = $tree;              # $_[0] is reference param!
	$count--;

	my $lMin = $min;
	my $lMax = ($val > $min) ? $val - 1 : $min;
	my $lCount = int(($count + 1) / 2);

	return unless $lCount > 0;

	my $rMin = ($val < $max) ? $val + 1 : $max;
	my $rMax = $max;
	my $rCount = $count - $lCount;
#	$rCount = $rCount == 0 ? 1 : $rCount; # Hack to make sure the array is fully populated.

	build($tree->{LEFT}, $lCount, $lMin, $lMax);
	build($tree->{RIGHT}, $rCount, $rMin, $rMax);
}

sub corrupt {
	my ($tree, $failDepth) = @_;

	corrupt_helper($tree, $failDepth, 0, undef);
}
sub corrupt_helper {
	my ($tree, $failDepth, $depth, $parent) = @_;

	my $child = int(rand(2)) == 1 ? $tree->{RIGHT} : $tree->{LEFT};
	unless ($child) { $child = $tree->{LEFT}; };

	if ($depth < $failDepth && $child) {
		return corrupt_helper($child, $failDepth, $depth + 1, $tree);
	}

	my $failVal;
	if ($child) {
		if ($child == $tree->{LEFT}) {
			$failVal = $child->{VALUE} + 1 + int(rand($buildMax - $child->{VALUE} - 1));
		}
		else {
			$failVal = $child->{VALUE} - 1 - int(rand($child->{VALUE} - 1));
		}
	}
	else {
		if ($tree == $parent->{LEFT}) {
			$failVal = $parent->{VALUE} + 1 + int(rand($buildMax - $parent->{VALUE} - 1));
		}
		else {
			$failVal = $parent->{VALUE} - 1 - int(rand($parent->{VALUE} - 1));
		}
	}

	if ($debug) {
		$failVal .= "X" . $tree->{VALUE};
	}

	$tree->{VALUE} = $failVal;
	$tree->{INVALID} = 1;
}

for (0..100+int(rand(50))) {
	my $buildCount = int(rand(40)) + 2;

	# Hack to fully populate the tree so that we don't have gaps in the resulting output.
	my $depth = int(log($buildCount) / log(2)) + 1;
	my $count = 2**$depth;

	my ($root);
	build($root, $count, $buildMin, $buildMax);

	my $failDepth = int(rand(log($buildCount) / log(2) + 1));
	corrupt($root, $failDepth) if (($buildCount == 1) ? 0 : int(rand(2)));

	print_tree($root, 0, 0);
	my @array = ();
	flatten($root, \@array, 0);

	# Chop off the tail elements resulting from inner "fill elements".
	while (scalar @array > $buildCount) { pop @array; }

	my $fail;
	for my $i (0..$#array) {
		# Verify we aren't producing duds...
		die "Blurp! $i" if not defined $array[$i];
		$fail = 1 if ($array[$i]->{INVALID});
	}

	my $input = join(' ', map({ $_->{VALUE} } @array));
	my $output = $fail ? "NO" : "YES";
	if ($debug) {
		print $input, "\n";
		print $output, "\n";
	}
	else {
		print $INFILE $input, "\n";
		print $OUTFILE $output, "\n";
	}
}

unless ($debug) {
	close $INFILE;
	close $OUTFILE;
}


#!/usr/bin/perl
use File::Spec;
use FindBin;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");
open(PRIMES,File::Spec->catfile($FindBin::Bin, "primes.txt"));
my %primes = ();
my @primes = ();
while(<PRIMES>){
	my $line = $_;
	chomp($line);
	$primes{$line} = 1;
	push(@primes,$line);
}
my $total = 0;
my $n = int(rand(80)) + 40;
my @list = ();
for(my $i = 0; $i < $n; $i++){
	my $choice = int(rand(100));
	if(($choice % 2) == 1){
		my $val = int(rand(10000));
		if($primes{$val} eq ""){
			push(@list,$val);
		}
	} else {
		my $val = $primes[int(rand(@primes))];
		push(@list,$val);
		$total += $val;
	}
}
foreach my $j (@list){
	print INFILE "$j\n";
}
print OUTFILE "$total\n";


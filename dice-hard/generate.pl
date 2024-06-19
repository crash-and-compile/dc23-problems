#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

open(WORDLIST,"wordlist.txt");
while(<WORDLIST>){
	my $line = $_;
	chomp($line);
	push(@words,$line);
}
$string .= $words[int(rand(@words))] .  " " . $words[int(rand(@words))]  . " " .$words[int(rand(@words))];
my @chars = split("",$string);
my $cipher = "";
foreach my $char (@chars){
	my $c = sprintf("%x ",ord(($char)));
	$cipher .= "$c ";
	#print "$c ";
}
print INFILE "$cipher\n";
print OUTFILE "$string\n";

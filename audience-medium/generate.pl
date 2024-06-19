#!/usr/bin/perl
use FindBin;
use Math::BaseCnv;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");
open(DICT,File::Spec->catfile($FindBin::Bin, "dict.txt"));
my @words = ();
while(<DICT>){
	my $line = $_;
	chomp($line);
	push(@words,$line);
}
close DICT;
my $pcnt = int(rand(10)) + 30;
for(my $n = 0; $n < $pcnt;$n++){

my $n = int(rand(20)) + 10;
my @list = ();
my @slist = ();
for(my $i =0; $i < $n; $i++){
	my $word = $words[int(rand(@words))];
	push(@list,$word);
}
@slist = sort @list;
my $in = "";
my $out = "";
foreach my $w (@list){
	$in .= "$w ";
}
$in =~ s/ $//;
print INFILE "$in\n";
foreach my $w (@slist){
	$out .= "$w ";
}
$out =~ s/ $//;
print OUTFILE "$out\n";
}
	

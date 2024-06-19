#!/usr/bin/perl
use strict;

use List::Util qw(shuffle);

my ($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

for (0..100+int(rand(50))) {

my @array = ();
for(my $x = 1; $x <= 15 + int(rand(25)); $x++){
	if(length($x) == 1){ $x = " " . $x;}
	$array[$x-1] = $x;
}
my @sarray = shuffle(@array);
#print "                  $sarray[0]\n";
#print "        $sarray[1]                   $sarray[2]\n";
#print "   $sarray[3]        $sarray[4]         $sarray[5]         $sarray[6]\n";
#print "$sarray[7]   $sarray[8]    $sarray[9]   $sarray[10]    $sarray[11]   $sarray[12]    $sarray[13]   $sarray[14]\n";
my $string = join(" ",@sarray);
my $node = int(rand(scalar @sarray - ($#sarray / 2)));;
my $val = $sarray[$node];

my $childnode = 2 * $node + 1;
my $child = $childnode < scalar @sarray ? $sarray[$childnode] : "X";
$string =~ s/ +/ /g;
$string =~ s/^ //g;
$string =~ s/ $//g;
$val =~ s/ //g;
$child =~ s/ //g;
#print "\nLeft child of [$val] is [$child]\n\n";
print INFILE "$string\n$val\n";
print OUTFILE "$child\n";

}


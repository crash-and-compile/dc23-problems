#!/usr/bin/perl
use GD;
use GD::Simple;
use MIME::Base64;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

$img = GD::Simple->new(50,50);
my $number = int(rand(9));
my @colors = ('red','black','blue','green');
$img->bgcolor($colors[int(rand(@colors))]);
$img->fgcolor($colors[int(rand(@colors))]);
my $choice = int(rand(100)) % 3;
my $type = "EMPTY";
if($choice == 0){
	my $x = int(rand(30)) + 10;
	my $y = int(rand(30)) + 10;
	my $w = int(rand(5))+10;
	my $h = $w;
	$img->moveTo($x, $y);
	$img->rectangle($x,$y,$x+$w,$y+$h);
	$type = "SQUARE";
} elsif($choice == 1){
	my $x = int(rand(30)) + 10;
	my $y = int(rand(30)) + 10;
	my $w = int(rand(5))+10;
	my $h = $w;
	$img->moveTo($x, $y);
	$img->ellipse($w,$h);
	$type = "CIRCLE";
} elsif($choice == 2){
} else{
}

my $encoded = MIME::Base64::encode($img->png);
#print "$encoded\n";
#$decoded = MIME::Base64::decode($encoded);
#my $inputfile = $problem_file . ".png";
#open my $out, '>', $inputfile or die;
#binmode $out;
#print $out $img->png;	
print INFILE "$encoded\n";
print OUTFILE "$type\n";


#!/usr/bin/perl
use GD;
use GD::Simple;
#use Image::Magick;
use MIME::Base64;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

for(my $n = 0; $n < 35 + int(rand(10)); $n++){
	my $img = GD::Simple->new(50,50);
	my $number = int(rand(9));
	my @colors = ('red','black','blue','green');
	$img->bgcolor('black');
	$img->fgcolor('black');
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
	print OUTFILE "$type\n";
	#print "[$type]\n";
	for(my $y = 0; $y < 50; $y++){
		for(my $x = 0; $x < 50; $x++){
			my $index = $img->getPixel($x, $y);
			my ($r,$g,$b) = $img->rgb($index);
			my $c = sprintf("%3d", $g);
			if($c == 255){
				print INFILE "0";
			} else {
				print INFILE "1";
			}
		}
		print INFILE "";
	}
	print INFILE "\n";
}

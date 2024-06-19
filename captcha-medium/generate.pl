#!/usr/bin/perl
use GD;
use GD::Simple;
use GD::Image;
#use MIME::Base64;
use Image::Filter;

($problem_file, $solution_file) = @ARGV;
open(INPUT,">$problem_file");
open(OUTPUT,">$solution_file");

$games = int(rand(23)+23);
for($gamenum = 0 ; $gamenum <= $games ; $gamenum++)
{
	$img = GD::Simple->new(25,50);
	my $number = int(rand(9)).int(rand(9)). int(rand(9));
	$img->bgcolor('black');
	$img->fgcolor('black');
	# $img->font('Courier');
	#$img->font('Times');
	$img->fontsize(30);

	my $x = int(rand(5));
	my $y = int(rand(5)) + 30;
	$img->moveTo($x, $y);
	$img->string($number);
	#my $tmpfile = "tmp.jpg";
	#open my $out, '>', $tmpfile or die;
	#binmode $out;
	#print $out $img->jpeg;
	#close $out;
	#my $output = GD::Simple->newFromJpeg("tmp.jpg");
	for(my $y = 0; $y < 50; $y++){
		for(my $x = 0; $x < 25; $x++){
			my $index = $img->getPixel($x, $y);
			my ($r,$g,$b) = $img->rgb($index);
			my $c = sprintf("%3d", $g);
			print INPUT "$g ";
		}
		#print INPUT "\n";
	}
	print OUTPUT "$number\n";
	print INPUT "\n";
}

close(INPUT);
close(OUTPUT);

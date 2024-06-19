#!/usr/bin/perl
use GD;
use GD::Simple;
use GD::Image;
#use MIME::Base64;
use Image::Filter;

($problem_file, $solution_file) = @ARGV;
open(INPUT,">$problem_file");
open(OUTPUT,">$solution_file");

my @char = ("1","2","3","4","5","6","7","8","9","0","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
my $pcnt = int(rand(10)) + 30;
for(my $n = 0; $n < $pcnt;$n++){

$img = GD::Simple->new(50,50);
my $number = $char[int(rand(@char))] . $char[int(rand(@char))] . $char[int(rand(@char))] . $char[int(rand(@char))] . $char[int(rand(@char))];
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
	for(my $x = 0; $x < 50; $x++){
		my $index = $img->getPixel($x, $y);
		my ($r,$g,$b) = $img->rgb($index);
		my $c = sprintf("%3d", $g);
		print INPUT "$g ";
	}
	#print INPUT "\n";
}
print OUTPUT "$number\n";
unless($n == $pcnt-1){print INPUT "\n";}
}

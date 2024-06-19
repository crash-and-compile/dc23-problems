#!/usr/bin/perl
use GD;
use GD::Simple;
use GD::Image;
use MIME::Base64;
use Image::Filter;

($problem_file, $solution_file) = @ARGV;
open(SOLUTION,">$solution_file");
my @face = ();
my @noface = ();
my @options = ("FACE","NOFACE");
opendir(FILES,"face");
my @files = readdir FILES;
foreach my $file (@files){
	unless($file =~ /\.jpeg/){ next; }
	push(@face,$file);
}
close FILES;
opendir(FILES,"noface");
my @files = readdir FILES;
foreach my $file (@files){
	unless($file =~ /\.jpeg/){ next; }
	push(@noface,$file);
}
close FILES;

my $choice = $options[int(rand(@options))];
#print "$choice\n";
if($choice eq "FACE"){
	my $chosen = $face[int(rand(@face))];
	open INFILE, '<', "face/$chosen";
	binmode INFILE;
	open OUTFILE, '>', $problem_file;
	my $buf;
	while ( read( INFILE, $buf, 4096 ) ) {
	    print OUTFILE encode_base64($buf);
	}

	close OUTFILE;
	close INFILE;

	#my $test = $problem_file . ".jpg";
	#open INFILE,  '<', $problem_file;
	#open OUTFILE, '>', "$test";
	#binmode OUTFILE;
	#my $buf;
	#while ( $buf = <INFILE> ) {
	#    print OUTFILE decode_base64($buf);
	#}

	#close OUTFILE;
	#close INFILE;

	print SOLUTION "$choice\n";

} else {
	my $chosen = $noface[int(rand(@noface))];
	open INFILE, '<', "noface/$chosen";
	binmode INFILE;
	open OUTFILE, '>', $problem_file;
	my $buf;
	while ( read( INFILE, $buf, 4096 ) ) {
	    print OUTFILE encode_base64($buf);
	}

	close OUTFILE;
	close INFILE;

	#my $test = $problem_file . ".jpg";
	#open INFILE,  '<', $problem_file;
	#open OUTFILE, '>', "$test";
	#binmode OUTFILE;
	#my $buf;
	#while ( $buf = <INFILE> ) {
	#    print OUTFILE decode_base64($buf);
	#}

	#close OUTFILE;
	#close INFILE;

	print SOLUTION "$choice\n";
}



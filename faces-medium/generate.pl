#!/usr/bin/perl
use GD;
use GD::Simple;
use GD::Image;
use MIME::Base64;
use Image::Filter;

($problem_file, $solution_file) = @ARGV;
open(SOLUTION,">$solution_file");
my @happy = ();
my @sad = ();
my @options = ("SAD","HAPPY");
opendir(FILES,"happy");
my @files = readdir FILES;
foreach my $file (@files){
	unless($file =~ /\.jpeg/){ next; }
	push(@happy,$file);
}
close FILES;
opendir(FILES,"sad");
my @files = readdir FILES;
foreach my $file (@files){
	unless($file =~ /\.jpeg/){ next; }
	push(@sad,$file);
}
close FILES;

my $choice = $options[int(rand(@options))];
#print "$choice\n";
if($choice eq "SAD"){
	my $chosen = $sad[int(rand(@sad))];
	open INFILE, '<', "sad/$chosen";
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
	my $chosen = $happy[int(rand(@happy))];
	open INFILE, '<', "happy/$chosen";
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



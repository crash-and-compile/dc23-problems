#!/usr/bin/perl
use Audio::Wav;
use Getopt::Std;

($problem_file, $solution_file) = @ARGV;
open(OUTFILE,">$solution_file");

if ($opts{h} || $opts{'?'}) {
  print usage();
  exit;
}
my $select = int(rand(1000));
if(($select % 2) == 1){

	my $outfile     = $problem_file;
	my $hertz       = int(rand(10))+1;
	my $seconds     = 1;
	my $harmonics   = 1;
	my $sample_rate = 44100; # CD quality;
	my $bits_sample = 4;    # 4,8,16 are all good choices
	my $volume_scalar = 1;

	my $wav = Audio::Wav->new;
	my $write = $wav->write($outfile, 
				{ 
				 bits_sample => $bits_sample,
				 sample_rate => $sample_rate,
				 channels    => 1,
				}
			       );

	my $pi     = (22/7); # close enough;
	my $len    = $seconds * $sample_rate;
	my $max_no = (2 ** $bits_sample) / 2 * $volume_scalar;

	# split Harmonics value into an array
	$harmonics = [ split /\s*,\s*/, $harmonics ];

	my $next = 0;
	for my $pos (0..$len) {
	  my $hz = $hertz;

	  # throw in some harmonics, but keep the tonic dominate
	  if ($pos % 2 == 1) {
	    $hz *= $harmonics->[$next++];
	  }
	  $next = 0 if $next >= @{$harmonics};

	  my $time = ($pos/$sample_rate) * $hz;

	  $write->write( sin($pi * $time) * $max_no );
	}

	$write->finish;

	print OUTFILE "SOUND";

} else {
	my @choices = ("bmp","jpg","png","pgm");
	my $choice = $choices[int(rand(@choices))];
	`cp img.$choice $problem_file`;	
	print OUTFILE "PICTURE";

}

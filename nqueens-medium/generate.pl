#!/usr/bin/perl
($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

my $pcnt = int(rand(10)) + 30;
for(my $n = 0; $n < $pcnt;$n++){
my $width = int(rand(8)) + 1;
my $height = int(rand(8)) + 1;
my $color = 0;
my $max = $width;
if($height < $max){ $max = $height; }
if(($width == 1)||($height == 1)){
	$max = 1;
} elsif(($width == 2)&&($height == 2)){
	$max = 1;
} elsif(($width == 3)&&($height == 3)){
	$max = 2;
}
my $alt = 0;
for(my $i = 0; $i < $height; $i++){	
	if(($i % 2) == 0){
		$color = 0;
	} else {
		$color = 1;
	}
	for(my $j = 0; $j < $width; $j++){
			if(($color % 2) == 0){
				$board[$i][$j] = "X";
			} else {
				$board[$i][$j] = "_";
			}
			$color += 1;
	}
}
my %qrow = ();
my %qcol = ();
my $toplace = $max;
while($toplace > 0){
	my $row = int(rand($height));
	my $col = int(rand($width));
#	print "Checking: Queen in $row=$qrow{$row} queen in $col=$qcol{$col}\n"; 
	while(($qrow{$row} ne "")||($qcol{$col} ne "")){
		$row = int(rand($height));
		$col = int(rand($width));		
#		print "Checking: Queen in $row=$qrow{$row} queen in $col=$qcol{$col}\n"; 
#		<STDIN>;
	}
	$qrow{$row} = 1;
	$qcol{$col} = 1;
	$board[$row][$col] = "$toplace";
	$toplace--;
}
	
my $fail = 0;
for(my $i = 0; $i < $height; $i++){
	for(my $j = 0; $j < $width; $j++){
		print INFILE "$board[$i][$j]";
		#if($board[$i][$j] =~ /\d/){
		#	print INFILE "Q";
		#} else {
		#	print INFILE $board[$i][$j];
		#}
	}
	print INFILE "\n";
	#print "\n";
}
my %conflicts = ();
for(my $i = 0; $i < $height; $i++){
	for(my $j = 0; $j < $width; $j++){
		if($board[$i][$j] =~ /\d/){
#			print "Vertical: ";
			for(my $v = 0; $v < $height; $v++){
				#print "board[$v][$j] = $board[$v][$j]";
				if(($board[$v][$j] =~ /\d/)&&($v ne $i)){
					$fail += 1;
					last;
				}
			}
#			print "Horizontal:";			
			for(my $h = 0; $h < $width; $h++){
				#print "board[$i][$h] = $board[$i][$h]";
				if(($board[$i][$h] =~ /\d/)&&($h ne $j)){
					$fail += 1;
					last;
				}
			}
			my $v = $i;
			my $h = $j;
			$v++;
			$h++;
			while(($v < $height)&&($h < $width)){
				if($board[$v][$h] =~ /\d/){
					$fail++;
					my $ref = $board[$v][$h];
					$conflicts{$ref} = 1;
					#print "Queen $board[$v][$h] conflicts at [$v][$h]\n";
				}
				$v++;
				$h++;
			}
			$v = $i;
			$h = $j;
			$v--;
			$h--;
			while(($v >= 0)&&($h >= 0)){
				if($board[$v][$h] =~ /\d/){
					$fail++;
					my $ref = $board[$v][$h];
					$conflicts{$ref} = 1;
					#print "Queen $board[$v][$h] conflicts at [$v][$h]\n";
				}
				$v--;
				$h--;
			}
			$v = $i;
			$h = $j;
			$v--;
			$h++;
			while(($v >= 0)&&($h < $width)){
				if($board[$v][$h] =~ /\d/){
					$fail++;
					my $ref = $board[$v][$h];
					$conflicts{$ref} = 1;
					#print "Queen $board[$v][$h] conflicts at [$v][$h]\n";
				}
				$v--;
				$h++;
			}
			$v = $i;
			$h = $j;
			$v++;
			$h--;
			while(($v < $height)&&($h >= 0)){
				if($board[$v][$h] =~ /\d/){
					$fail++;
					my $ref = $board[$v][$h];
					$conflicts{$ref} = 1;
					#print "Queen $board[$v][$h] conflicts at [$v][$h]\n";
				}
				$v++;
				$h--;
			}
		}
	}
}
my $cnt = 0;
my $res = "";
foreach my $q (sort {$a <=> $b} keys %conflicts){
	$res .= "$q ";
	$cnt++;
}
$res =~ s/ $//;
if($cnt > 0){ 
	#print "$res";
	print OUTFILE "$res\n";
} else {
	#print "PASS";
	print OUTFILE "PASS\n";
}
unless($n == $pcnt-1){print INFILE "\n";}
}

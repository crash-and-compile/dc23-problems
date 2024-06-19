#!/usr/bin/perl

($given_file, $answer_file) = @ARGV;
open(INFILE,"$given_file");
open(OUTFILE,"$answer_file");

my @answers = ();
my @provided = ();
my $temp = "";
while(<INFILE>){
	my $line = $_;
	chomp($line);
	if($line eq ""){
		$temp =~ s/\|$//g;
		unless($temp eq ""){
			#print "$temp\n";
			push(@provided,"$temp");
		}
		$temp = "";
	} else {
		$temp .= "$line|";
	}
	 
}
close INFILE;
$temp =~ s/\|$//g;
unless($temp eq ""){
	#print "$temp\n";
	push(@provided,"$temp");
}
$temp = "";
while(<OUTFILE>){
	my $line = $_;
	chomp($line);
	if($line eq ""){
		$temp =~ s/\|$//g;
		unless($temp eq ""){
			#print "$temp\n";
			push(@answers,"$temp");
		}
		$temp = "";
	} else {
		$temp .= "$line|";
	}
	 
}
close OUTFILE;
$temp =~ s/\|$//g;
unless($temp eq ""){
	#print "$temp\n";
	push(@answers,"$temp");
}

my $checkcnt = 0;
my $testcasecnt = @provided;
#print "$testcasecnt cases\n";
for(my $x = 0; $x < $testcasecnt; $x++){
	my @given = split(/\|/,$provided[$x]);
	my @answer = split(/\|/,$answers[$x]);
#	print "CHECKING $checkcnt....\n";
	#print "GIVEN:\n";
	foreach my $ref (@given){
		#print "$ref\n";
	}
	foreach my $ref (@answer){
#		print "$ref\n";
	}
	$checkcnt++;
	
	my $rcnt = 0;
	my $ccnt = 0;
	my $row = 0;
	my $vboard = ();
	my $board = ();
	foreach my $line (@given){
	#while(<INFILE>){
		#my $line = $_;
		chomp($line);
		#print "$line\n";
		my @row = split(//,$line);
		my $col = 0;
		$ccnt = 0;
		foreach my $colval (@row){
			$ccnt++;
			$vboard[$row][$col] = $colval;
			$col++;
		}
		$rcnt++;
		$row++;
	}
	my $height = $rcnt;
	my $width = $ccnt;
	my $max = $height;
	if($max > $width){ $max = $width; }
	if(($width == 2)&&($height == 2)){
		$max = 1;
	}
	my $fail = 0;
	$row = 0;
	my $qref = 1;
	foreach my $line (@answer){
#	while(<OUTFILE>){
#		my $line = $_;
		chomp($line);
		#print "$line\n";
		my @row = split(//,$line);
		my $col = 0;
		foreach my $colval (@row){
			if($colval eq "Q"){
				$board[$row][$col] = $qref;
				$col++;
				$qref++;
				#print "FOUND QUEEN!\n";
			} else {
				#print "$vboard[$row][$col] eq $colval\n";
				if($vboard[$row][$col] eq $colval){
					$board[$row][$col] = $colval;
					$col++;
				} else {
					#print "Mismatch at [$row][$col]: $vboard[$row][$col] vs $colval\n";
					$fail++;
				}
			}		
		}
		$row++;
	}


	if($fail > 0){
		print "0\n";
		next;
	}
	if(!(($qref - 1) == $max)){
		print "0\n";
		next;
	}
	#print "[$width,$height] MAX QUEENS=$max\n";
	my $fail = 0;
#	print "  ";
#	for(my $j = 0; $j < $width; $j++){
#		print "$j";
#	}
	for(my $i = 0; $i < $height; $i++){
		for(my $j = 0; $j < $width; $j++){
			#print $board[$i][$j];
		}
#		print "\n";
	}
	for(my $i = 0; $i < $height; $i++){
		for(my $j = 0; $j < $width; $j++){
			if($board[$i][$j] =~ /\d/){
	#			print "Checking queen $board[$i][$j] at [$i][$j]...\n";
	#			print "Vertical: ";
				for(my $v = 0; $v < $height; $v++){
					#print "board[$v][$j] = $board[$v][$j]";
					if(($board[$v][$j] =~ /\d/)&&($v ne $i)){
	#					print "FAIL\n";
						$fail += 1;
						last;
					} else {
	#					print "PASS\n";
					}
				}
				if($fail == 0){
	#				print "Horizontal:";			

					for(my $h = 0; $h < $width; $h++){
						#print "board[$i][$h] = $board[$i][$h]";
						if(($board[$i][$h] =~ /\d/)&&($h ne $j)){
	#						print "FAIL\n";
							$fail += 1;
							last;
						} else {
	#						print "PASS\n";
						}
					}
				}
				my $v = $i;
				my $h = $j;
				$v++;
				$h++;
				while(($v < $height)&&($h < $width)){
					if($board[$v][$h] =~ /\d/){
						$fail++;
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
						#print "Queen $board[$v][$h] conflicts at [$v][$h]\n";
					}
					$v++;
					$h--;
				}
			}
		}
	}
	if($fail > 0){
		print "0\n";
	} else {
		print "1\n";
	}
	#print INFILE "$x\t$y\t$z\n";
	#print OUTFILE "$val\n";
}

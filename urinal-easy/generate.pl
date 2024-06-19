#!/usr/bin/perl
#
# 
# Urinal example
#
# ./generate.pl <problem_text> <solution_text>
#
# - Never use an occupied urinal.
# - Do not select a urinal immediately adjacent to another occupant if possible.
# - It's better to have a free urinal on one side than to have neighbors on BOTH sides.
# - Choose lower numbered urinals (closer to the door) first.
# - Absolutely NO talking
#
# For the purposes of this easy version, you MUST pick a urinal.
# You have a bladder infection and will die if you do not urinate.
#
# #SAMPLE INPUT
#         1 OCCUPIED
#         2 OPEN
#         3 OPEN
#         4 OPEN
#         5 OCCUPIED
#
# #SAMPLE OUTPUT
#         3
#

($problem_file, $solution_file) = @ARGV;

# pick a random number of urinals to create
$restroom = ();
$urinals = int(rand(924)) + 101;
$fill = int(rand($urinals - 101)) + 100;

# construction
for($n = 1 ; $n <= $urinals ; $n++)
{
  $restroom[$n] = "OPEN";
}

# now we get busy
for($n = 1 ; $n <= $fill ; $n++)
{
  &occupy_urinal();
}

# generate problem
$problem_text = "";
for($n = 1 ; $n <= $urinals ; $n++)
{
  $problem_text .= $restroom[$n] . "\n";
}

# solve it
# - Never use an occupied urinal.
# - Do not select a urinal immediately adjacent to another occupant if possible.
# - It's better to have a free urinal on one side than to have neighbors on BOTH sides.
# - Choose lower numbered urinals (closer to the door) first.
# - Absolutely NO talking

# try to find open stall with free spot on each side

$found = 0;
$good = 0;
$n = 0;
while(!$found and $n <= $urinals)
{
  $n++;
  # look for an open stall
  $good = 0;
  if($restroom[$n] eq "OPEN")
  {
    $good = 1;
    # look at previous urinal
    if($restroom[$n - 1] eq "OCCUPIED")
    {
      $good = 0;
    }
    if($restroom[$n + 1] eq "OCCUPIED")
    {
      $good = 0;
    }
  }
  if($good)
  {
    # we're starting at 0, but we're expecting starting at 1.
    $solution_text = "$n\n";
    $found = 1;
  }
}

$good = 0;
$n = 0;
while(!$found and $n <= $urinals)
{
  $n++;
  # look for an open stall
  $good = 0;

  if($restroom[$n] eq "OPEN")
  {
    $good = 2;

    # look at previous urinal
    if($restroom[$n - 1] eq "OCCUPIED")
    {
      $good--;
    }
    if($restroom[$n + 1] eq "OCCUPIED")
    {
      $good--;
    }
  }
  if($good)
  {
    $solution_text = "$n\n";
    $found = 1;
  }
}

$n = 0;
while(!$found and $n <= $urinals)
{
  $n++;
  # no stalls with one free spots so rerun and look for first empty spot
  if($restroom[$n] eq "OPEN")
  {
    $solution_text = "$n\n";
    $found = 1;
  }
}



if($problem_file and $solution_file)
{
  open PROBLEM, ">", $problem_file or die $!;
  print PROBLEM $problem_text;
  close(PROBLEM);

  open SOLUTION, ">", $solution_file or die $!;
  print SOLUTION $solution_text;
  close(SOLUTION);
}
else
{
  print $problem_text;
  print $solution_text;
}

sub occupy_urinal()
{
  $spot = int(rand($urinals)) + 1;
  if($restroom[$spot] eq "OPEN")
  {
    $restroom[$spot] = "OCCUPIED";
  }
  else
  {
    &occupy_urinal();
  }
}

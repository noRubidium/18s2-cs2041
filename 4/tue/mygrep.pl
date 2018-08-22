

$reverse = 0;
if ($ARGV[0] eq "-v") {
  shift @ARGV;
  $reverse = 1;
}
$pattern = shift @ARGV;
while(<>) {
  print if /$pattern/ ^ $reverse;
}

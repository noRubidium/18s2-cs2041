
$reverse = 0;
if ($ARGV[0] eq "-v") {
  $reverse = 1;
  shift @ARGV;
}

$pattern = shift @ARGV;

@ARGV = ('-') if (@ARGV == 0);
while (<>) {
  if (/$pattern/ ^ $reverse) {
    print;
  }
}

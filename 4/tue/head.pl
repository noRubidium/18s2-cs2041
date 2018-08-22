#!/usr/bin/env perl -w

$n_lines = 10;
if (@ARGV && $ARGV[0] =~ /^-[0-9]+$/) {
  $n_lines = shift @ARGV;
  $n_lines =~ s/-//;
}

# $n = 1;
# while (<STDIN>) {
#   last if ($n++ > $n_lines);
#   print;
# }
open $input, "<", "-" or die "-: can't open $!\n";

$ARGV[0] = "-" if (@ARGV == 0);

foreach $file (@ARGV) {
  open $input, "<", $file or die "$file: can't open $!\n";
  print "==> $file <===\n";
  @lines = <$input>;
  print @lines[0..$n_lines - 1];
  close $input;
}

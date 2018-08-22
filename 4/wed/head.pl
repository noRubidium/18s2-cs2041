#!/usr/bin/perl -w

$n = 10;

# @arr = (0, 1, 2, 3)
# shift @arr -> 0;
# @arr -> (1, 2, 3)
if (@ARGV != 0 && $ARGV[0] =~ /^-\d+$/) {
  $n = shift @ARGV;
  $n =~ tr/-//d;
}

#
# $count = 0;
# while ($line = <STDIN>) {
#   last if ($count >= $n);
#   print $line;
#   $count++;
# }

#@ARGV = ('-') if (@ARGV == 0);
if (@ARGV == 0) {
  @lines = <STDIN>;
  print "==============> $f <===============\n";
  print @lines[0..((@lines > $n) ? $n : @lines) - 1];
}

foreach my $f (@ARGV) {
  open INPUT, "<", "$f" or die "$f: unable to open file $!\n";
  @lines = <INPUT>;
  print "==============> $f <===============\n";
  print @lines[0..((@lines > $n) ? $n : @lines) - 1];
}

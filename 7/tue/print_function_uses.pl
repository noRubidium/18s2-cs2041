#!/usr/bin/perl -w

use strict;

my $function = $ARGV[0];

foreach my $c_file (glob "*.c") {
  open my $f, "<", $c_file or die "meh\n";
  while (my $line = <$f>) {
    $line =~ s/".*?"//g;
    $line =~ s/\/\/.*$//g;
    $line =~ s/\/\*.*?\*\///g;

    $line =~ /\b$function\s*\(/ or next;

    print "$c_file:$. function $function ";
    if ($line =~ /^\s/) {
      print "used\n";
    } elsif ($line =~ /;/) {
      print "declared\n";
    } else {
      print "defined\n";
    }
  }

  close $f;

}

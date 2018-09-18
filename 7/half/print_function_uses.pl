#!/usr/bin/env perl -w

use strict;
use warnings;

my $function = $ARGV[0];


foreach my $file (glob "*.c") {
  open my $f, "<", $file or die "$file: can not open file $!\n";

  foreach my $line (<$f>) {
    $line =~ s/"[^"]*?"//g;
    $line =~ s/\/\/.*$//g;
    $line =~ s/\/\*.*?\*\///g;
    if ($line =~ /\b$function\s*\(/) {
      # found the function name
      if ($line =~ /^\s/) {
        print "$file:$. function $function used\n";
      } elsif ($line =~ /;/) {
        print "$file:$. function $function declared\n";
      } else {
        print "$file:$. function $function defined\n";
      }
    }
  }

  close $f;
}

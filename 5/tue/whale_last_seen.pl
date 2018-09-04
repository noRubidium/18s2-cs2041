#!/usr/bin/perl -w

use strict;

my %last_seen;

while (my $line = <>) {
  if ($line =~ /^(\d{2}\/\d{2}\/\d{2})\s+(\d+)\s+(.*)\s*$/) {
    my $curr_whale_type = $3;
    my $curr_date = $1;
    $last_seen{$curr_whale_type} = $curr_date;
  } else {
    die "Unrecognized line pattern.\n";
  }
}

foreach my $whale (sort keys %last_seen) {
  print "$whale $last_seen{$whale}\n";
}

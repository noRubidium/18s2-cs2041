#!/usr/bin/env perl
use strict;

my %last_seen;

while (my $line = <>) {
  # print $line;
  if ($line =~ /^(\d{2}\/\d{2}\/\d{2})\s+(\d+)\s+(.+)\s*/) {
    my $curr_date = $1;
    my $curr_name = $3;
    $last_seen{$curr_name} = $curr_date;
  }
}

foreach my $whale (sort keys %last_seen) {
  print "$whale $last_seen{$whale}\n";
}

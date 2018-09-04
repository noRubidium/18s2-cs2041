#!/usr/bin/perl -w

use strict;

my $prev_whale_type = "";
my $prev_date = "";
my $prev_count = 0;
while (my $line = <>) {
  if ($line =~ /^(\d{2}\/\d{2}\/\d{2})\s+(\d+)\s+(.*)\s*$/) {
    my $curr_whale_type = $3;
    my $curr_date = $1;
    my $curr_count = $2;
    if ($curr_whale_type eq $prev_whale_type && $curr_date eq $prev_date) {
      $prev_count += $curr_count;
    } else {
      print "$prev_date $prev_count $prev_whale_type\n" if ($prev_count != 0);
      $prev_date = $curr_date;
      $prev_count = $curr_count;
      $prev_whale_type = $curr_whale_type;
    }
  } else {
    die "Unrecognized line pattern.\n";
  }
}

print "$prev_date $prev_count $prev_whale_type\n" if ($prev_count != 0);

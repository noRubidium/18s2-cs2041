#!/usr/bin/env perl -w
# $line = <>;
# @matches = $line =~ /\d{2}\s+\d{2}/g;
# $" = ", ";
# $, = "@";
# print "a", @matches,"\n";
# print "@matches\n";
use strict;

my $prev_date = "";
my $prev_count = 0;
my $prev_name = "";

while (my $line = <>) {
  # print $line;
  if ($line =~ /^(\d{2}\/\d{2}\/\d{2})\s+(\d+)\s+(.+)\s*/) {
    my $curr_date = $1;
    my $curr_count = $2;
    my $curr_name = $3;
    if ($prev_name eq $curr_name && $prev_date eq $curr_date) {
      $prev_count += $curr_count;
    } else {
      print "On $prev_date, I saw $prev_count ${prev_name}s\n" if ($prev_date);
      $prev_date = $curr_date;
      $prev_count = $curr_count;
      $prev_name = $curr_name;
    }
  }
}

#!/usr/bin/perl -w

use strict;

my %count;

while (my $line = <STDIN>) {
  my @words = ($line =~ /[a-z]+/gi); #split /[^a-zA-Z]+/, $line;
  foreach my $word (@words) {
    $word =~ tr/A-Z/a-z/;
    # $word = lc $word;
    $count{$word}++;
  }
}

foreach my $key (reverse sort {$count{$a} <=> $count{$b}} keys %count) {
  print "$key $count{$key}\n";
}

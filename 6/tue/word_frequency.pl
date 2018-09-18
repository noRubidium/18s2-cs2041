#!/usr/bin/env perl -w

use strict;

my %frequency;

while (my $line = <>) {
  chomp $line;
  $line =~ tr/A-Z/a-z/;
  my @words = $line =~ /[a-z]+/g; #split /\W+/, $line;
  foreach my $word (@words) {
    $frequency{$word}++;
  }
}

foreach my $word (reverse sort {$frequency{$a} <=> $frequency{$b}} keys %frequency) {
  print "$frequency{$word}\t$word\n";
}

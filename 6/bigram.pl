#!/usr/bin/perl -w

use strict;

my %bigrams;
my %count;

while (my $line = <STDIN>) {
  my @words = ($line =~ /[a-z]+/gi); #split /[^a-zA-Z]+/, $line;
  my $prev_word;
  foreach my $word (@words) {
    $word =~ tr/A-Z/a-z/;
    $count{$word}++;
    if (defined $prev_word) {
      $bigrams{$prev_word}{$word}++;
    }
    # $word = lc $word;
    $prev_word = $word;
  }
}

foreach my $word (sort keys %bigrams) {
  my @sorted = sort {$bigrams{$word}{$b} <=> $bigrams{$word}{$a}} keys %{$bigrams{$word}};
  my $bigram = shift @sorted;
  printf "%8s(%02d) %8s(%02d)\n", $word, $count{$word},
    $bigram, $bigrams{$word}{$bigram};
}

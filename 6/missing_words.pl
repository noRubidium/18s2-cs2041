#!/usr/bin/perl -w

use strict;

my $file1 = $ARGV[0];
my $file2 = $ARGV[1];

my %result;

my %seen;

open F2, "<", $file2 or die ;
while (my $line = <F2>) {
  my @words = ($line =~ /[a-z]+/gi); #split /[^a-zA-Z]+/, $line;
  foreach my $curr_word (@words) {
    $curr_word =~ tr/A-Z/a-z/;
    # $word = lc $word;
    # check if it exist in file 2
    $seen{$curr_word} = 1;
  }
}
close F2;

open F1, "<", $file1 or die "$file1: failed to open file $!\n";

while (my $line = <F1>) {
  my @words = ($line =~ /[a-z]+/gi); #split /[^a-zA-Z]+/, $line;
  foreach my $word (@words) {
    $word =~ tr/A-Z/a-z/;
    # $word = lc $word;
    # check if it exist in file 2
    if (!defined $seen{$word}) {
      $result{$word} = 1;
    }
  }
}

close F1;

print join "\n", sort keys %result;

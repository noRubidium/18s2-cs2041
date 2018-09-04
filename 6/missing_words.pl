#!/usr/bin/env perl -w

use strict;

my $file1 = $ARGV[0];
my $file2 = $ARGV[1];

my %seen = {};
my %result = {};

open F2, '<', $file2 or die "file doesn't exist\n";
while (my $line = <F2>) {
    chomp $line;
    $line = lc $line;
    my @words = $line =~ /[a-z]+/g;
    foreach my $word (@words) {
      $seen{$word} = 1;
    }
}
close F2;

open F1, '<', $file1 or die "file doesn't exist\n";
while (my $line = <F1>) {
    chomp $line;
    $line =~ tr/A-Z/a-z/;
    my @words = $line =~ /[a-z]+/g;
    foreach my $word (@words) {
      if (defined $seen{$word}) {
        $result{$word} = 1;
      }

      # check if the word exist in the second file
    }
}
close F1;

# open F2, '<', $file2 or die "file doesn't exist\n";
# while (my $line = <F2>) {
#     chomp $line;
#     $line = lc $line;
#     my @words = $line =~ /[a-z]+/g;
#     foreach my $word (@words) {
#       delete $seen{$word};
#     }
# }
# close F2;

foreach my $key (sort keys %result) {
  print "$key\n";
}

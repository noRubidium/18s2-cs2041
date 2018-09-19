#!/usr/bin/perl -w

use strict;
use warnings;


my $sort_by_requency = 0;

if ($ARGV[0] eq '-f') {
  shift @ARGV;
  $sort_by_requency = 1;
}
my $url = $ARGV[0];
my %count = ();

open F, '-|', "wget -O- -q $url" or die "failed to open url\n";

foreach my $line (<F>) {
  foreach my $tag ($line =~ /<(\w+)\s*[^>]*>/g) {
    if ($tag ne "!--") {
      $count{$tag}++;
    }
  }
}

close F;

my @tags = sort {$sort_by_requency ? $count{$b} <=> $count{$a} : $a cmp $b} keys %count;

foreach my $tag (@tags) {
  print "$tag\t$count{$tag}\n";
}

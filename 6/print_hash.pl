#!/usr/bin/perl -w

use strict;

sub printHash {
  my ($depth, %tab) = @_;
  my $n = 0;

  if ($depth == 1) {
    foreach my $k (sort keys %tab) {
      print "[$k] => $tab{$k}\n";
      $n++;
    }
  } else {
    foreach my $k (sort keys %tab) {
      print "[$k] => \n";
      printHash(($depth - 1), %tab{$k});
      $n++;
    }

  }

  return $n;
}

my %colours =
  ("John" => ("John" => "blue", "Anne" => "red", "Andrew" => "green")
  , "Anne" => ("John" => "blue", "Anne" => "red", "Andrew" => "green"), "Andrew" => ("John" => "blue", "Anne" => "red", "Andrew" => "green"));

print (printHash 2, %colours);
print "\n";

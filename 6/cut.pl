#!/usr/bin/perl -w

use strict;

my $n = shift @ARGV;
my $m = shift @ARGV;

my $count = $m - $n;

foreach my $line (<>) {
  chomp $line;
  my @chars = split //, $line;
  print @chars[$n..(@chars > $m ? $m : $#chars)], "\n";
  # my $regex = "^.{$n}(.{,$count})";
  # if ($line =~ /^.{1}(.{7})/) {
  #   print "$1\n";
  # }  elsif ($line =~ /^.{1}(.*)/) {
  #   print "$1\n";
  # } else {
  #   print "\n";
  # }
}

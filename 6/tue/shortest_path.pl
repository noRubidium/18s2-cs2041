#!/usr/bin/env perl -w

use strict;

my $start = $ARGV[0];
my $finish = $ARGV[1];

my %distance;

while (my $line = <STDIN>) {
  if ($line =~ /(\S+)\s+(\S+)\s+(\d+)/) {
    $distance{$1}{$2} = $3;
    $distance{$2}{$1} = $3;
  }
}


my %shortest_distance;
my %route;
my @unprocessed_city = keys %distance;
my $curr_city = $start;

$shortest_distance{$start} = 0;
$route{$start} = "";

while ($curr_city ne $finish) {
  @unprocessed_city = grep {$_ ne $curr_city} @unprocessed_city;
  print @unprocessed_city;

  foreach my $city (@unprocessed_city) {
    if (defined $distance{$curr_city}{$city}) {
      my $d = $shortest_distance{$curr_city} + $distance{$curr_city}{$city};
      if (!defined $shortest_distance{$city} || $shortest_distance{$city} > $d) {
        $shortest_distance{$city} = $d;
        $route{$city} = "$route{$curr_city} $curr_city";
      }
    }
  }

  # look for the next city
  my $min_distance;
  $curr_city = "";
  foreach my $city (@unprocessed_city) {
    if (defined $shortest_distance{$city}) {
      if ($curr_city eq ""
        || $shortest_distance{$city} < $min_distance) {
        $curr_city = $city;
        $min_distance = $shortest_distance{$city};
      }
    }
  }
}

print "shortest_distance: $shortest_distance{$finish}
route: $route{$finish} $finish\n";

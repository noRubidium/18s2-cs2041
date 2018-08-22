#!/usr/bin/env perl

@lines = <STDIN>;
foreach my $line (@lines) {
  # $line =~ s/[aeiou]//gi;
  $line =~ tr/aeiou/AEIOU/;
  print $line;
}



# while (<STDIN>) {
#   s/[aeiou]//gi;
#   print;
# }

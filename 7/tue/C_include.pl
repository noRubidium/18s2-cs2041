#!/usr/bin/perl -w

use strict;
sub include_file {
  my ($file, @includes) = @_;
  open my $f, '<', $file or die;
  while (my $line = <$f>) {
    if ($line =~ /^#\s*include\s*"([^"]*)"/) {
      include_file($1, @includes);
    } elsif ($line =~ /^#\s*include\s*<([^>]*)>/) {
      my $curr_file = $1;
      foreach my $dir (@includes) {
        if (-e "$dir$curr_file") {
          include_file("$dir$curr_file", @includes);
          last;
        }
      }
    } else {
      print $line;
    }
  }
}

my @includes = ('/usr/include/', '/usr/local/include/', '/usr/include/x86_64-linux-gnu/');

foreach my $file (@ARGV) {
  include_file($file, @includes);
}

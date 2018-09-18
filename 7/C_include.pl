#!/usr/bin/perl -w

use strict;

sub print_include {
  my ($c_file, @c_includes) = @_;
  open F, '<', $c_file or die "$c_file\n";
  foreach my $line (<F>) {
    if ($line =~ /^#\s*include\s*\"([^"]*)\"$/) {
      my $include_file = $1;
      print_include($include_file, @c_includes);
    } elsif ($line =~ /^#\s*include\s*<([^>]*)>$/) {
      foreach my $dir (@c_includes) {
        if (-e "$dir$1") {
          print_include("$dir$1", @c_includes);
        }
      }
    } else {
      print $line;
    }
  }

  close F;
}

my $c_file = $ARGV[0];
my @c_includes = ("/usr/include/", "/usr/local/include/", "/usr/include/x86_64-linux-gnu");

print_include($c_file, @c_includes);

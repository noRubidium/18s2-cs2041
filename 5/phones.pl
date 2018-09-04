#!/usr/bin/env perl -w

die "usage :: ./$0 <url>\n" if (!@ARGV);

$url = $ARGV[0];
open F, "-|", "wget -O- -q $url" or die "failed to open website $!\n";


foreach my $line (<F>) {
  @matches = $line =~ /[\d -]+/g;
  foreach my $match (@matches) {
    $match =~ s/\D//g;
    print "$match\n" if (length $match >= 8 && length $match <= 15);
  }
}

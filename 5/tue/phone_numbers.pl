#!/usr/bin/perl

my $url = $ARGV[0];

open INPUT, "-|", "wget -q -O- $url" or die "can't open $url";
while (my $line = <INPUT>) {
  @numbers = $line =~ /[\d\ \-]+/g;
  foreach my $number (@numbers) {
    $number =~ s/\D//g;
    # print "$number\n" if ($number =~ /^\d{8,15}$/);
    print "$number\n" if (length $number >= 8 && length $number <= 15);
  }

}

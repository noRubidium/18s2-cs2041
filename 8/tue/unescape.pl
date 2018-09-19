

$url = "http://www.cse.unsw.edu.au";

sub unescape {
  my ($line) = @_;

  $line =~ s/&lt;/</gi;
  $line =~ s/&gt;/>/gi;
  $line =~ s/&amp;/&/gi;
  $line =~ s/ +//gi;
  return $line;
}

open F, '-|', "wget -O- -q $url" or die "failed to open url\n";

foreach my $line (<F>) {
  if ($line =~ /^([^><]*)</) {
    print unescape($1);
  }
  foreach my $text ($line =~ />([^<]*)</g) {
    print unescape($text);
  }
  if ($line =~ />([^><])$/) {
    print unescape($1);
  }
}


close F;

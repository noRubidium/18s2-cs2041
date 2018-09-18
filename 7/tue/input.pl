#!/usr/bin/perl -w
sub scan_next_n {
  my ($n) = @_;
  my $result = "";
  while ($n > 0) {
    $result .= <>;
    $n--;
  }

  return $result;
}

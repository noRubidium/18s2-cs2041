

sub hashToHTML {
  my (%hash) = @_;
  my $str = "<table border=\"1\" cellpadding=\"5\">\n<tr><th> Key </th><th> Value </th></tr>\n";
  foreach my $key (keys %hash) {
    $str .= "<tr><td> $key </td><td> $hash{$key} </td></tr>\n";
  }

  $str .= "</table>\n";
  return $str;
}

# the hash table ...
%colours = ("John"=>"blue", "Anne"=>"red", "Andrew"=>"green");
# and the function call ...
$out = hashToHTML(%colours);

print $out;

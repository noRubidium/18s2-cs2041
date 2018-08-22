#!/usr/bin/env perl -w
print "it\'s", "\n";
print 'it\'s', "\n";


$a = "hello";

print "$a world!\n";
print '$a world!\n', "\n";
#
# if (42 == "42") {
#   print "42 equals to \"42\"\n";
# }

print "42 equals to \"42\"\n" if (42 == "42");
#
# "==, !=, >, <, >=, <=" -> numeric
# "eq ne gt ge lt le" -> str
# "$a =~ // $a !~ //"


print "same\n" if ("3" == "3.0");
print "different\n" if ("3" ne "3.0");
print "3", " ", "3.0", "\n";
# $normal
# @ARGV -> $ARGV[0] ->

$length = @ARGV;
print "number of arguments: ", $#ARGV + 1, "\n";
print "number of arguments: ", $length, "\n";
# %dict


print "$2.50", "\n";
print '$2.50', "\n";

$a = "aabbbbcccAAAAAAEEE";
if ($a =~ /a(b*)(c*)/) {
  print "matched, \$1 is: $1, group 2 is: $2\n"
}

$a =~ s/[aeiou]/*/gi;
print "$a\n";

# @lines = <STDIN>;
# for (my $i = 0; $i < @lines; $i++) {
#   $lines[$i] =~ s/[aeiou]/*/gi;
#   print $lines[$i];
# }
#
# foreach my $line (@lines) {
#   $line =~ s/[aeiou]/*/gi;
#   print $line;
# }
#
# foreach my $i (0..@lines-1) {
#   $lines[$i] =~ s/[aeiou]/*/gi;
#   print $lines[$i];
# }

while ($line = <STDIN>) {
  $line =~ tr/aeiou/*/;
  print $line;
}

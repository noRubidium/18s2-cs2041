print "it\'s", "\n";
print 'it\'s', "\n";
print "43" . 43, "\n";
print "43" + "43", "\n";
print "equal\n" if ("3" == "3.0");
print "str not equal\n" if ("3" ne "3.0");

print "$2.50", "\n";
print '$2.50', "\n";

$str = "a" . "b";
print $str, "\n";

# command line arguments
print "a","b","c", "\n";
print "@ARGV", "\n";
print @ARGV, "\n";
print $ARGV[2], "\n";

print $#ARGV + 1, "\n";
$len = @ARGV;
print $len, "\n";

#!/usr/bin/perl -w

# First Perl version of cat
# Verbose, but shows exactly what's happening

# if no args, read from stdin
if (@ARGV == 0) {
    while ($line = <STDIN>) {
        # note: line still has \n
        print $line;
    }
} else {
    foreach $file (@ARGV) {
        open my $input, '<', $file or die "Can not open $file: $!\n";
        while ($line = <$input>) {
                print $line;
        }
        close $input;
    }
}

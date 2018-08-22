#!/usr/bin/perl -w

# Second Perl version of cat
# More concise, by using special variable $_

if (@ARGV == 0) {
    while (<STDIN>) {
        print $line;
    }
} else {
    foreach $file (@ARGV) {
        open my $input, '<', $file or die "Can not open $file: $!\n";
        while (<$input>) {
                print;
        }
        close $input;
    }
}

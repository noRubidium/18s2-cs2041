#!/usr/bin/perl -w

# Fourth Perl version of cat
# More concise, but makes filtering difficult

if (@ARGV == 0) {
    print <STDIN>;
} else {
    foreach $file (@ARGV) {
        open my $input, '<', $file or die "Can not open $file: $!\n";
        print <$input>;
        close $input;
    }
}

#!/usr/bin/perl -w

# Third Perl version of cat
# places input into an array

if (@ARGV == 0) {
    @lines = <STDIN>;
    print @lines;
} else {
    foreach $file (@ARGV) {
        open my $input, '<', $file or die "Can not open $file: $!\n";
        @lines = <$input>;
        print @lines;
        close $input;
    }
}

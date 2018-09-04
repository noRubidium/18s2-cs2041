#
# $x = 'x';
# for ($i = 1; $i <= 3; $i++) {
#     $x = "($x)";
# }
# print "$x\n";
#
# $x = '(((x)))';
# $i = 4;
#
# @hi = split //,"hello";
# for ($i = 0; $i < 4; $i++) {
#     print $hi[$i];
#     print @hi[0..2];
# }
# print "\n";
#
# @hi = ('h', 'e', 'l', 'l', 'o');
#
# @vec = (10 .. 20);
# print "@vec[1..3]\n";
# 10, 11, 12, 13 ....
# 11 12 13
#
# $,
# $"
#
# foreach $n (1..10) {
#     if ($n > 5) {
#       last;
#     }
#     print "$n ";
#     next if ($n % 2 == 0);
#     print "$n ";
# }
# print "\n";
#
# 1 1 2 3 3 4 5 5

@arr = (0..2);

$" = "haha";
$, = ",";

print @arr, "\n";
# 012
print "@arr\n";
# 0 1 2

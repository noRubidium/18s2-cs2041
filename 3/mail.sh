#!/bin/sh

mlalias COMP2041-list |
egrep -v ":" |
sed 's/^ *//g' |
xargs acc |
egrep -o "[A-Z]{4}[0-9]{4}_Student" |
sed 's/_Student//' |
sort |
uniq -c |
sort -nr

#!/bin/sh

mlalias COMP2041-list |
egrep -v ":" |
sed 's/^ *//g' |
while read stu;
do
  acc $stu |
  egrep -o "[A-Z]{4}[0-9]{4}_Student" |
  sed 's/_Student//'
done |
sort |
uniq -c |
sort -nr

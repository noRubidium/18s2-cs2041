
mlalias COMP2041-list |
egrep -v ":" |
sed 's/^ *//g' |
xargs acc |
egrep -o '[A-Z]{4}[0-9]{4}_Student' |
sed 's/_Student//'|
sort |
uniq -c |
sort -nr

# mlalias COMP2041-list |
# egrep -v ":" |
# sed 's/^ *//g' |
# while read uid;
# do
#   acc $uid|
#   egrep -o '[A-Z]{4}[0-9]{4}_Student' |
#   sed 's/_Student//'
# done |
# sort |
# uniq -c |
# sort -nr

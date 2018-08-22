#!/bin/sh -e

find "$@" -type f |
while read file;
do
  echo "VISITING: #$file#"

  sed -i 's/COMP2041/COMP2042/ig' "$file"
  sed -i 's/COMP9041/COMP9042/ig' "$file"

done

# for file in "$@";
# do
#
#   sed -i 's/COMP2041/COMP2042/ig' "$file"
#   sed -i 's/COMP9041/COMP9042/ig' "$file"
#
# done

#
# for file in "$@";
# do
#
#   if test -e "$file.bck";
#   then
#     echo "$file.bck already exist!"
#     exit 1
#   fi
#
#   sed 's/COMP2041/COMP2042/ig' "$file" |
#   sed 's/COMP9041/COMP9042/ig' > "$file.bck"
#
#   mv "$file.bck" "$file"
# done

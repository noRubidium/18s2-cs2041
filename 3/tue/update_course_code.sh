#!/bin/sh -e

find "$@" -type f |
while read file;
do
  # Create backup

  echo "trying to access file: $file"

  backup="$file.bck"
  if test -e "$backup"; then
    echo "File $backup already exist!"
    exit 1
  fi
  cat "$file" > "$backup"
  # Do sed
  sed 's/COMP2042/COMP2042/g' "$backup" |
  sed 's/COMP9042/COMP9042/g' > "$file"

  rm "$backup"
done

# for file in "$@";
# do
#   # Create backup
#   backup="$file.bck"
#   if test -e "$backup"; then
#     echo "File $backup already exist!"
#     exit 1
#   fi
#   cat "$file" > "$backup"
#   # Do sed
#   sed 's/COMP2042/COMP2042/g' "$backup" |
#   sed 's/COMP9042/COMP9042/g' > "$file"
#
#   rm "$backup"
# done

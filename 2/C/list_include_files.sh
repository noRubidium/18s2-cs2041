#!/bin/sh

for file in *.c
do
  echo "$file includes:"

  egrep '^#include' "$file" |
  sed 's/[">][^">]*$//' |
  sed 's/^[^"<]*["<]/    /'
done

#!/bin/sh

for file in *.c
do
  echo "$file includes:"
  egrep "^#include" $file |
  sed -E 's/[">][^">]*$//' |
  sed -E 's/^[^"<]*["<]/      /'
done

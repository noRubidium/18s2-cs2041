#!/bin/sh

sort -k2 Students |
while read line; do
  student_number=`echo $line | egrep '[0-9]{7}' -o`
  name=`echo $line | cut -d' ' -f2-`
  output=`egrep "$student_number" Marks | cut -d' ' -f2`
  output="$output\t$name"
  echo $output
done

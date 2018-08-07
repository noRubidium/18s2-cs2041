#!/bin/sh

sort Students -k2 |
while read line
do
  student_number=`echo "$line" | egrep -o '[0-9]*'`
  mark=`egrep "$student_number" Marks | cut -f2 -d' '`
  student_name=`echo "$line" | cut -d' ' -f2-`

  echo "$mark $student_name"
done

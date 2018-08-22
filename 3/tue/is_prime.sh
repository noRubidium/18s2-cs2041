#!/bin/sh

i=2

while test $i -lt $1; do
  if test `expr $1 % $i` -eq 0
  then
    echo "$1 is not prime"
    exit 1
  fi
  i=$(($i + 1))
done
echo "$1 is prime"

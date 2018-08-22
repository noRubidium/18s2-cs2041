#!/bin/sh

n=$1

for i in `seq 2 $(($n - 1))`;
do
  if test `expr $n % $i` -eq 0;
  then
    echo "$n is not prime"
    exit 1
  fi
done

echo "$n is prime"

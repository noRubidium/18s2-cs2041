#!/bin/sh

n=$1

for i in `seq 2 $n`;
do
  # if $i is a prime print it
  if ./is_prime.sh $i > /dev/null; then
    echo $i
  fi
done

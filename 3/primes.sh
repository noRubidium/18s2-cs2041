#!/bin/sh

n=100

i=2

while test $i -le $n;
do
  if ./is_prime.sh $i > /dev/null;
  then
    echo $i
  fi
  i=$(($i + 1))
done

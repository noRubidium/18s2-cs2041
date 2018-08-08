#!/bin/sh

if test $# -eq 1; then
  first=1
  incr=1
  last="$1"
elif test $# -eq 2; then
  first="$1"
  incr=1
  last=$2
elif test $# -eq 3; then
  first=$1
  incr=$2
  last=$3
else
  echo "Expecting 1 or 2 or 3 args"
  exit 1
fi

# Validate the variables
if ! (echo "$first" | egrep -q "[1-9][0-9]*"); then
  echo "Expecting int"
  exit 1
fi
if ! (echo "$incr" | egrep -q "[1-9][0-9]*"); then
  echo "Expecting int"
  exit 1
fi
if ! (echo "$last" | egrep -q "[1-9][0-9]*"); then
  echo "Expecting int"
  exit 1
fi

i="$first"
while test "$i" -le "$last"; do
  echo $i
  i=$(($i + $incr))
done

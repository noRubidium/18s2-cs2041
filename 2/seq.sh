#!/bin/sh

# ./seq.sh 1 2 3
if test $# -eq 1;
then
  start=1
  end="$1"
  step=1
elif test $# -eq 2;
then
  start="$1"
  end="$2"
  step=1
elif test $# -eq 3;
then
  start="$1"
  end="$3"
  step="$2"
else
  echo errr
  exit 1
fi

if test $step -le 0;
then
  echo errr
  exit 1
fi

i=$start
while test $i -le $end;
do
  echo $i
  i=$(($i + $step))
done

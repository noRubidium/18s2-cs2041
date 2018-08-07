#!/bin/sh

for file in *.html;
do
  if egrep -q '</?blink>' "$file";
  then
    mv "$file" "$file.bad"
  fi
done

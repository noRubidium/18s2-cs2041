#!/bin/bash

i="HEllo"

if [[ $i =~ "o" ]]
then
  echo "success";
else
  echo "failure";
fi

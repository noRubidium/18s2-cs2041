#!/bin/sh

acc "$@" |
egrep -o "[A-Z]{4}[0-9]{4}_Student" |
sed 's/_Student//'

#!/bin/sh

awk -F '-|,' '$1<=$3&&$2>=$4||$3<=$1&&$4>=$2 {s+=1} END{print s}' input.txt

awk -F '-|,' '$1>$4||$2<$3 {s+=1} END{print NR-s}' input.txt


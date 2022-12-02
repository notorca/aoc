#!/bin/sh

awk -F'\n' -v RS='\n\n' '{sum=0; for(i=1; i<=NF; i++) sum+=$i; if (sum>max) max=sum;} END{print(max)}' input.txt

awk -F'\n' -v RS='\n\n' '{for(i=1; i<=NF; i++) e[NR]+=$i} END{n=asort(e); print(e[n]+e[n-1]+e[n-2])}' input.txt

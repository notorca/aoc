#!/bin/sh

awk -v 'a=abcdefghijklmnopqrstuvwxyz' -F '' '{r="[" substr($0,NF/2+1) "]"; match($0,r,c); sum+=index(a toupper(a), c[0])} END{print sum}' input.txt

awk -v 'a=abcdefghijklmnopqrstuvwxyz' 'NR%3==1{r="[^" $0 "]"} NR%3==2{gsub(r,"");l=$0} NR%3==0{match($0,"["l"]",c); sum+=index(a toupper(a), c[0])} END{print sum}' input.txt

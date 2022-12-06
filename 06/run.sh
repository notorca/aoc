#!/bin/sh

awk -F '' '{for(i=1;i<NF-3;i++) {s=substr($0,i,4); if(gsub($i,"",s)*gsub($(i+1),"",s)*gsub($(i+2),"",s)*gsub($(i+3),"",s)) {print i+3; break}}}' input.txt

awk -F '' '{for(i=1;i<NF-13;i++) {s=substr($0,i,14); x=1;for(j=i;j<i+14;j++)x*=gsub($j,"",s); if(x){print i+13; next}}}' input.txt

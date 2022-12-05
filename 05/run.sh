#!/bin/sh

awk -v 'FIELDWIDTHS=1:1 3:1 3:1 3:1 3:1 3:1 3:1 3:1 3:1' '$1==1{d=FS=" "} !d{for(i=1;i<=NF;i++) if($i!=" ")sub(/$/,$i,s[i])} /move/{for(i=1;i<=$2;i++) sub(/^/,substr(s[$4],i,1),s[$6]); s[$4]=substr(s[$4],$2+1)} END{for (k in s) printf("%s",substr(s[k],1,1))}' input.txt

awk -v 'FIELDWIDTHS=1:1 3:1 3:1 3:1 3:1 3:1 3:1 3:1 3:1' '$1==1{d=FS=" "} !d{for(i=1;i<=NF;i++) if($i!=" ")sub(/$/,$i,s[i])} /move/{sub(/^/,substr(s[$4],1,$2),s[$6]); s[$4]=substr(s[$4],$2+1)} END{for (k in s) printf("%s",substr(s[k],1,1))}' input.txt

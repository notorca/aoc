#!/bin/sh

awk '/\$ cd \//{d="/"} /\$ cd \.\./{sub(/\w+\/$/,"",d)} /\$ cd \w+/{sub(/$/,$3"/",d)} /[0-9+]/{for(k=d;k;sub(/\w*\/$/,"",k)) t[k]+=$1} END{for(k in t) if(t[k] <= 100000) s+=t[k]; print s}' input.txt

awk '/\$ cd \//{d="/"} /\$ cd \.\./{sub(/\w+\/$/,"",d)} /\$ cd \w+/{sub(/$/,$3"/",d)} /[0-9+]/{for(k=d;k;sub(/\w*\/$/,"",k)) t[k]+=$1} END{b=t["/"]; n=30000000-70000000+b; for(k in t) if(t[k]<b&&t[k]>=n) b=t[k]; print b}' input.txt

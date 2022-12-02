#!/bin/sh

awk '/(A X)|(B Y)|(C Z)/{sum+=3} /(A Y)|(B Z)|(C X)/{sum+=6} {sum+=index("XYZ",$2)} END{print(sum)}' input.txt

awk '/. X/{sum+=index("BCA",$1)} /. Y/{sum+=index("ABC",$1)+3} /. Z/{sum+=index("CAB",$1)+6} END{print(sum)}' input.txt

#!/usr/bin/env factor

USING: ascii assocs command-line io.encodings.ascii io.files
kernel literals math namespaces prettyprint sequences
sequences.extras sequences.repeating ;

IN: 01_2

<PRIVATE

: input-file-lines ( -- seq )
  command-line get dup empty? [ drop "input.txt" ] [ first ] if
  ascii file-lines ;

<<
CONSTANT: digits-as-words { "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" }
CONSTANT: digits { "1" "2" "3" "4" "5" "6" "7" "8" "9" }
>>
CONSTANT: mapping $[ digits-as-words digits append digits 2 repeat zip ]

: tails-strings ( string -- seq )
  [ dup empty? not ] [ [ rest ] keep ] produce nip ;

:: map-to-digit ( prefix-string -- digit/f )
  mapping [ first prefix-string swap head? ] map-find nip [ second ] [ f ] if* ;

: fix-string ( s -- sr )
  tails-strings [ map-to-digit ] [ ] map-filter concat ;


PRIVATE>

MAIN: [
input-file-lines
[ fix-string [ digit? ] filter [ first CHAR: 0 - 10 * ] [ last CHAR: 0 - ] bi + ] map sum .
]

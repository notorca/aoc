#!/usr/bin/env factor

USING: ascii assocs command-line io.encodings.ascii io.files
kernel math math.parser namespaces prettyprint sequences
sequences.extras sequences.repeating splitting strings ;

IN: 02_1

<PRIVATE

: input-file-lines ( -- seq )
  command-line get [ "input.txt" ] [ first ] if-empty
  ascii file-lines ;

: split-string ( seq string -- seq ) split-subseq [ >string ] map ; inline

: first-to-number ( seq -- seq ) unclip-slice string>number prefix ;

: game-to-assoc-seq ( string -- assoc-seq )
  ": " split1 nip "; " split-string
  [ ", " split-string
    [ " " split first-to-number ]
    map
  ]
  map ;

CONSTANT: cube-limits {
  { "red" 12 }
  { "green" 13 }
  { "blue" 14 }
}
: cube-valid? ( count color -- ? ) cube-limits at <= ; inline
: iteration-valid? ( seq -- ? ) [ first2 cube-valid? ] all? ;
: game-valid? ( assoc-seq -- ? ) [ iteration-valid? ] all? ;

: status-bool-sec-to-index-sum ( seq -- n )
  0 [| prev flag idx | flag { prev idx 1 } sum prev ? ] reduce-index ;

PRIVATE>

MAIN: [
input-file-lines
  [ game-to-assoc-seq game-valid? ] map status-bool-sec-to-index-sum .
]

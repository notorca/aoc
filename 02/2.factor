#!/usr/bin/env factor

USING: arrays ascii assocs command-line grouping.extras
io.encodings.ascii io.files kernel math math.order math.parser
namespaces prettyprint sequences sequences.extras
sequences.repeating sorting splitting strings ;

IN: 02_2

<PRIVATE

: input-file-lines ( -- seq )
  command-line get [ "input.txt" ] [ first ] if-empty
  ascii file-lines ;

: split-string ( seq string -- seq ) split-subseq [ >string ] map ; inline

: first-to-number ( seq -- seq ) unclip-slice string>number prefix ;

: game-to-assoc-seq ( string -- assoc-seq )
  ": " split1 nip
    "; " split-string
      [ ", " split-string
        [ " " split first-to-number ]
      map ]
    map concat ;

: min-cubes-for-game ( assoc-seq -- assoc )
  [ second ] sort-by [ second ] group-by [ first2 [ first ] [ max ] map-reduce 2array ] map ;

: cubes-set-power ( assoc -- n )
  [ second ] [ * ] map-reduce ;

PRIVATE>

MAIN: [
input-file-lines
  [ game-to-assoc-seq min-cubes-for-game cubes-set-power ] [ + ] map-reduce .
]

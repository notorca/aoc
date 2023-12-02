#!/usr/bin/env factor

USING: ascii io.encodings.ascii io.files kernel math prettyprint sequences ;

IN: 01_1

MAIN: [
"input.txt" ascii file-lines [ [ digit? ] filter [ first CHAR: 0 - 10 * ] [ last CHAR: 0 - ] bi + ] map sum .
]
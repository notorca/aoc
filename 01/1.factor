#!/usr/bin/env factor

USING: ascii io.encodings.ascii io.files kernel math prettyprint sequences ;

IN: 01_1

MAIN: [
"input.txt" ascii file-lines [ [ digit? ] filter [ first 48 - 10 * ] [ last 48 - ] bi + ] map sum .
]
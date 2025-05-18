#!/bin/sh
# \
    exec wish "$0" "$@"

set txt [label .la -relief raised -text \
	     "Labels can be configured with text"]
grid $txt
set var [label .lb -textvariable label2Var -relief sunken]
grid $var
set label2Var "Or by using a variable"

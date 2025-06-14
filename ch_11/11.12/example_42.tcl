#!/bin/sh
# \
    exec wish "$0" "$@"

# Create the label.
label .l -text "" -width 25
grid .l
# Assign some text.
set str "Tcl makes programming Fun"
# And add new text to the label one character at a time
for {set i 1} {$i < [string length $str]} {incr i} {
    .l configure -text [string range $str 0 $i]
    update idle
    # Mark time for a second or so.
    #   (Better delay technique described in the next section)
    for {set j 0} {$j < 100000} {incr j} {
        set x [expr $j * .02]
    }
}

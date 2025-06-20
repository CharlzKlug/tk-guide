#!/bin/sh
# \
    exec wish "$0" "$@"

# 103. What option will set the color of the text in a button?
button .b -text "Hello!"
.b configure -foreground #f50000
.b configure -activeforeground #f50000
grid .b

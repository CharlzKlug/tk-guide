#!/bin/sh
# \
    exec wish "$0" "$@"

# 106. Can a button's -command option contain more than one Tcl command?
button .btn -text "Button" -command "puts hello!; puts \"How are you?\""
grid .btn

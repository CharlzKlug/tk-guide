#!/bin/sh
# \
    exec wish "$0" "$@"

# 102 What conventions does Tcl use to define screen distances?
button .exit_button -text "QUIT" -command exit -borderwidth 3p
grid .exit_button

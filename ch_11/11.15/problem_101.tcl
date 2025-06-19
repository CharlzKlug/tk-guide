#!/bin/sh
# \
    exec wish "$0" "$@"

button .exit_button -text "QUIT" -command exit
.exit_button configure -background #FF0000
.exit_button configure -activebackground #00FF00
grid .exit_button

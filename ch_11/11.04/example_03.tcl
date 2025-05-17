#!/bin/sh
# \
    exec wish "$0" "$@"

button .exit_button -text "QUIT" -command exit
puts [.exit_button configure]

#!/bin/sh
# \
    exec wish "$0" "$@"

button .exit_button -text "QUIT" -command exit
puts "The exit button text is: [.exit_button cget -text]"
puts "The exit button text color is: [.exit_button cget -foreground]"

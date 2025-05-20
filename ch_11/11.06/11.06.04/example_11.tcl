#!/bin/sh
# \
    exec wish "$0" "$@"

namespace eval buttonSpace {
    proc makeButton {} {
	button .b -text "Button" \
	    -command [namespace current]::buttonProc
	grid .b
    }
    proc buttonProc {} {
	puts "You clicked button .b"
    }
}

buttonSpace::makeButton

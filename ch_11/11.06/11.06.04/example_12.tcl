#!/bin/sh
# \
    exec wish "$0" "$@"

namespace eval guiDemo {
    variable varName "Original Value"

    proc makeButton {} {
	label .l -textvar [namespace current]::varName

	button .b -text "Button" \
	       -command [namespace code {set varName "New Value"}]
	grid .l
	grid .b
    }
}
guiDemo::makeButton

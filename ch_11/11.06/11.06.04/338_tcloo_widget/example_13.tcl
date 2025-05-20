#!/bin/sh
# \
    exec wish "$0" "$@"

oo::class create guiDemo {
    variable objectVar

    constructor {} {
	set objectVar "Before button is clicked"
	label .l -textvar [namespace current]::objectVar
	button .b -text "Button" \
	    -command "[self] changeObjectVar"
	grid .l
	grid .b
    }
    method changeObjectVar {} {
	set objectVar "After button was clicked"
    }
}
guiDemo new

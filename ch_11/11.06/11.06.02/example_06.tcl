#!/bin/sh
# \
    exec wish "$0" "$@"

# set myLabel [label .l1 -text "This is the beginning text"]
# set myButton [button .b1 -text "click to modify label" \
#		  -command \
#		  "$myLabel configure -text {The Button was Clicked}"]
# grid $myLabel
# grid $myButton

namespace eval demo {
    variable labelText "This is the beginning text"
    set myLabel [label .l1 \
		     -textvariable [namespace current]::labelText]
    set myButton [button .b1 -text "click to modify label" \
		      -command [namespace code \
				    {set labelText {The Button was Clicked}}]]
    grid $myLabel
    grid $myButton
}

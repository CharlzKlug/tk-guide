#!/bin/sh
# \
    exec wish "$0" "$@"

set clickButton [button .b1 -text "Please Click Me" \
		     -command {.b1 configure -text "I've been Clicked!"}]
grid $clickButton

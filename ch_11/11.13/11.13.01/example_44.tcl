#!/bin/sh
# \
    exec wish "$0" "$@"

# Schedule the task to exit in 10 seconds
set exitEvent [after 10000 exit]
button .b -text "Click me to cancel exit!" \
    -command "after cancel $exitEvent"
pack .b

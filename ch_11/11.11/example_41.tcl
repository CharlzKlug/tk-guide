#!/bin/sh
# \
    exec wish "$0" "$@"

# Create a label in the original window
label .l -text "I'm in the original window"

# Create a new window, and a label for it
toplevel .otherTopLevel
label .otherTopLevel.l -text "I'm in the other window"

# Display the labels.
wm title . "My Application"
grid .l
grid .otherTopLevel.l

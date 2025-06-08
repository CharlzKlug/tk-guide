#!/bin/sh
# \
    exec wish "$0" "$@"

# Create and display an empty listbox
listbox .l -height 3
grid .l
# Add 3 elements to the listbox
# Note - insert at position 0 makes the display order the
# opposite of the insertion order.
.l insert 0 first
.l insert 0 second
.l insert 0 third

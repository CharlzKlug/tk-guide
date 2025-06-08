#!/bin/sh
# \
    exec wish "$0" "$@"

# Create and display an empty listbox
listbox .l -height 3
grid .l
# Add 3 elements to the listbox
# Note - insert at end position - order is as expected.
.l insert end first
.l insert end second
.l insert end third

bind .l {<<ListboxSelect>>}  {puts "Selected: [.l curselection]"}

#!/bin/sh
# \
    exec wish "$0" "$@"

# Create the scrollbar and listbox.
scrollbar .scroll -command ".box yview"
listbox .box -height 4 -width 8 \
    -yscrollcommand ".scroll set"

# Grid them onto the screen - note -sticky option
grid .box .scroll -sticky ns

# Fill the listbox
.box insert end 0 1 2 3 4 5 6 7 8 9 10

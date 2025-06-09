#!/bin/sh
# \
    exec wish "$0" "$@"

# Create and grid a scrollbar with no -command option
scrollbar .sb
grid .sb -row 0 -column 0 -sticky ns

# Create and grid a listbox (to fill space and expand the
# scrollbar)
listbox .lb
grid .lb -row 0 -column 1

# The scrollbar slider will start at the 1/3 position,
# and stop at the 9/10 position.
.sb set .3 .9

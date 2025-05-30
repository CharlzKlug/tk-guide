#!/bin/sh
# \
    exec wish "$0" "$@"

# Create a "Settings" menubutton
menubutton .mb -menu .mb.mnu -text "Settings" \
    -relief raised -background gray70
menu .mb.mnu

# Add font selectors
.mb.mnu add radiobutton -label "Large Font" \
    -variable font -value {Times 18 bold}
.mb.mnu add radiobutton -label "Small Font" \
    -variable font -value {Times 8 normal}
grid .mb

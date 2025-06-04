#!/bin/sh
# \
    exec wish "$0" "$@"

# Create a "Files" menu
menubutton .mb -menu .mb.mnu -text "Files" \
    -relief raised -background gray70
menu .mb.mnu
# Insert open and exit as first and last
# selections
.mb.mnu insert 0 command -label "Open" \
    -command openFile
# .. Other menu entries...
.mb.mnu insert end command -label "Exit" \
    -command quitTask
grid .mb

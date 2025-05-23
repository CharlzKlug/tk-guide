#!/bin/sh
# \
    exec wish "$0" "$@"

label .la -background gray80 -text LEFT -relief solid
label .lb -background gray80 -text TOP -relief solid
pack .la -side left
pack .lb -side top -anchor w
. configure -background white -relief solid -borderwidth 3
wm geometry . 80x50

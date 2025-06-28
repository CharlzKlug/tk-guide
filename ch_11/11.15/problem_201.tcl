#!/bin/sh
# \
    exec wish "$0" "$@"

array set colorcount {
    0 #000000
    1 #0000FF
    2 #00FF00
    3 #00FFFF
    4 #FF0000
    5 #FF00FF
    6 #FFFF00
    7 #FFFFFF
}

set currentColor 0

proc switchColor {} {
    uplevel 1 {
        .btn configure -background $colorcount($currentColor)
        .btn configure -activebackground $colorcount($currentColor)
        incr currentColor
        if {$currentColor > 7} {set currentColor 0}
        showNextColor
    }
}

proc showNextColor {} {
    uplevel 1 {.btn configure \
                   -text "Next color: $colorcount([expr $currentColor % 8])"}
}

button .btn -text "" -command \
    "switchColor"
showNextColor
grid .btn

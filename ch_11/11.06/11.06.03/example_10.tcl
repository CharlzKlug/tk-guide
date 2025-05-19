#!/bin/sh
# \
    exec wish "$0" "$@"

proc translate {widgetList request} {
    if {[string match "En Francais" $request]} {
	upvar #0 french table
    } else {
	upvar #0 english table
    }

    foreach w $widgetList {
	$w configure -text $table([$w cget -text])
    }
}

array set english {Nom Name Rue Street}
array set french {Name Nom Street Rue}
grid [label .name -text Name]
grid [label .street -text Street]
button .convert -text "En Francais" -command \
    {translate {.convert .name .street} [.convert cget -text]}
grid .convert

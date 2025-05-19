#!/bin/sh
# \
    exec wish "$0" "$@"

array set english {Nom Name Rue Street}
array set french {Name Nom Street Rue}

grid [label .name -text Name]
grid [label .street -text Street]

button .translate -text "En Francais" -command {
    foreach w {.name .street} {
	if {[catch {$w configure -text $french([$w cget -text])}]} {}
    }
}
grid .translate

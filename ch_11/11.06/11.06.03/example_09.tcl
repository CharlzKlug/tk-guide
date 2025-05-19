#!/bin/sh
# \
    exec wish "$0" "$@"

array set english {Nom Name Rue Street "In English" "En Francais"}
array set french {Name Nom Street Rue "En Francais" "In English"}
grid [label .name -text Name]
grid [label .street -text Street]
button .translate -text "En Francais" -command {
    if {[string match [.translate cget -text] "En Francais"]} {
	foreach w {.name .street .translate} {
	    $w configure -text $french([$w cget -text])
	}
    } else {
	foreach w {.name .street .translate} {
	    $w configure -text $english([$w cget -text])
	}
    }
}
grid .translate

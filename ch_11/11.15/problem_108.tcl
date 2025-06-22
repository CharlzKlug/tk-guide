#!/bin/sh
# \
    exec wish "$0" "$@"

# 108. How many items in a set of radiobuttons can be selected simultaneously?
set price 0
radiobutton .rb1 -text "1" -variable price -value 1
radiobutton .rb2 -text "2" -variable price -value 2
button .bt -text "Get price" -command {eval puts "\$price"}
grid .rb1
grid .rb2
grid .bt

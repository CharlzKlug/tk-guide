#!/bin/sh
# \
    exec wish "$0" "$@"

# ------------------------------------------------
# Create a checkbutton menu - Place it on the left
set checkButtonMenu [menubutton .mcheck \
                         -text "checkbuttons" -menu .mcheck.mnu]
set checkMenu [menu $checkButtonMenu.mnu]
grid $checkButtonMenu -row 0 -column 0
$checkMenu add checkbutton -label "check 1" \
    -variable checkButton(1) -onvalue 1
$checkMenu add checkbutton -label "check 2" \
    -variable checkButton(2) -onvalue 2

# --------------------------------------------------
# Create a radiobutton menu - Place it in the middle
set radioButtonMenu [menubutton .mradio \
                         -text "radiobuttons" -menu .mradio.mnu]
set radioMenu [menu $radioButtonMenu.mnu]
grid $radioButtonMenu -row 0 -column 1
$radioMenu add radiobutton -label "radio 1" \
    -variable radioButton -value 1
$radioMenu add radiobutton -label "radio 2" \
    -variable radioButton -value 2

# -----------------------------------------------------------
# Create a menu of mixed check, radio, command, cascading and
#   menu separators
set mixButtonMenu [menubutton .mmix -text "mixedbuttons" \
                       -menu .mmix.mnu]
set mixMenu [menu $mixButtonMenu.mnu]
grid $mixButtonMenu -row 0 -column 2

# ------------------------
# Two command menu entries
$mixMenu add command -label "command 1" -command "doStuff 1"
$mixMenu add command -label "command 2" -command "doStuff 2"

# ---------------------------------------------
# A separator, and two radiobutton menu entries
$mixMenu add separator
$mixMenu add radiobutton -label "radio 3" \
    -variable radioButton -value 3
$mixMenu add radiobutton -label "radio 4" \
    -variable radioButton -value 4

# ---------------------------------------------
# A separator, and two checkbutton menu entries
$mixMenu add separator
$mixMenu add checkbutton -label "check 3" \
    -variable checkButton(3) -onvalue 3
$mixMenu add checkbutton -label "check 4" \
    -variable checkButton(4) -onvalue 4

# ------------------------------------------------
# A separator, a cascading menu, and two sub menus
#   within the cascading menu
$mixMenu add separator
$mixMenu add cascade -label "cascader" \
    -menu $mixMenu.cascade
menu $mixMenu.cascade
$mixMenu.cascade add command -label "Cascaded 1" \
    -command "doStuff 3"
$mixMenu.cascade add command -label "Cascaded 2" \
    -command "doStuff 4"

# Define a dummy proc for the command buttons to invoke.
proc doStuff {args} {
    puts "doStuff called with: $args"
}

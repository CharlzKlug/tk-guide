#!/bin/sh
# \
    exec wish "$0" "$@"

set demoMode 1

menubutton .mb -menu .mb.mnu -text "Files" \
    -relief raised

menu .mb.mnu
.mb.mnu add command -label Open
.mb.mnu add separator

foreach {label cmd} {Save saveCmd AutoSave autoSaveCmd \
                         SaveAs saveAsCmd} {
    .mb.mnu add command -label $label -command $cmd
}

.mb.mnu add separator

.mb.mnu add command -label Exit

# ... much code.
# If running in demo mode. remove "Save" menu items'
if {$demoMode} {
    set first [.mb.mnu index Save]
    # Delete the first separator as well
    incr first -1
    set last [.mb.mnu index SaveAs]
    .mb.mnu delete $first $last
}
grid .mb

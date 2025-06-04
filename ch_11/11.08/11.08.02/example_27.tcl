#!/bin/sh
# \
    exec wish "$0" "$@"

set demoMode 0
set permission 1

menubutton .mb -menu .mb.mnu -text "Files" \
    -relief raised -background gray70

menu .mb.mnu
.mb.mnu insert 0 command -label "Open" \
    -command openFile

.mb.mnu add separator

.mb.mnu add command -label "Save" \
    -command saveData

.mb.mnu add command -label "SaveAs" \
    -command saveDataAs
grid .mb

# If in demo mode, disable the Save options

if {$demoMode} {
    .mb.mnu entryconfigure 3 -state disabled
    .mb.mnu entryconfigure 4 -state disabled
}

# ... In file open code.
# Check write permission on file. If not
#   writable, set 'permission' to 0, else 1.
# ...
# Remove save option if no write permission

if {!$permission} {
    .mb.mnu delete Save
}

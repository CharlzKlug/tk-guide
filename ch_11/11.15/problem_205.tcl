#! /bin/sh
#\
    exec wish "$0" "$@"

# 205. Turn the example in Section 6.4 into a GUI application. Add an entry
# widget to set the starting directory, a button to start searching the
# directories, a label to show the directory currently being examined, and a
# scrolling listbox to display the results. The text in the listbox should have
# leading spaces to denote which files are within previous directories. You may
# need to create the listbox with "-font {courier}" to display the leading
# spaces.

proc fileDict {parent} {
    set dct {}
    foreach fl [glob -nocomplain $parent/*] {
        if {[file type $fl] eq "directory"} {
            dict set dct $fl [fileDict $fl]
        } else {
            dict set dct $fl {}
        }
    }
    return $dct
}

proc showDict {dct indent} {
    # If dict keys fails, this is not a dictionary.
    # Print it and return.
    if {[catch {dict keys $dct}]} {
        puts "[string repeat " " $indent]$dct"
        return
    }

    # Step through the keys in this dictionary and recurse
    foreach k [dict keys $dct] {
        puts "[string repeat " " $indent]$k"
        set v [dict get $dct $k]
        showDict $v [expr {$indent + 2}]
    }
}

# label .startingDirectoryLabel -text "Starting directory:"
# entry .startingDirectoryEntry -background #FFFFFF
# button .searchButton -text "Search"

# grid .startingDirectoryLabel .startingDirectoryEntry .searchButton -sticky w
# pack .startingDirectoryLabel -side top -anchor w
# pack .startingDirectoryEntry -side right -after .startingDirectoryLabel

# ---
# frame .root -background black
# pack .root -side left -anchor w

# frame .root.twoLabels -background gray50
# label .root.twoLabels.upperLabel -text "twoLabels no fill top"
# label .root.twoLabels.lowerLabel -text "twoLabels no fill lower"
# pack .root.twoLabels -side left
# pack .root.twoLabels.upperLabel -side top
# pack .root.twoLabels.lowerLabel -side bottom
# ---

# frame .root.nofill -background gray50
# label .root.nofill.label -text "nofill, noexpand"
# pack .root.nofill -side left
# pack .root.nofill.label

# frame .root
# pack .root

# label .root.startDirLabel -text "Starting directory:"
# pack .root.startDirLabel -side left
# pack .root.startingDirectoryEntry -side left -after .root.startDirLabel -fill x

# frame .root2
# pack .root2 -side left -after .root -fill x
# entry .root2.startingDirectoryEntry -background #FFFFFF
# pack .root2.startingDirectoryEntry -fill x

# В этом фрейме лежат элементы управления
frame .frameControl
pack .frameControl -fill x

label .frameControl.la -background gray80 -text LEFT -relief solid
label .frameControl.lb -background green -text TOP -relief solid
label .frameControl.lc -background red -text RIGHT -relief solid

pack .frameControl.la -side left -anchor n
pack .frameControl.lb -side left -fill x -expand yes -after .frameControl.la -anchor n
pack .frameControl.lc -side left -after .frameControl.lb -anchor n

# В этом фрейме лежит метка с текущей обрабатываемой директорией
frame .frameInfo
pack .frameInfo -fill x

label .frameInfo.lInfo -background yellow -text "Directory: NONE" -relief solid
pack .frameInfo.lInfo -side left

listbox .lbTest -background #FFFFFF
pack .lbTest -fill both -expand yes
# label .ld -background blue -text MIDDLE -relief solid
# pack .ld -side right

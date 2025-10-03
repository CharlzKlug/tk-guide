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
               .lbTest insert end $fl
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

# В этом фрейме лежат элементы управления
frame .frameControl
pack .frameControl -fill x

label .frameControl.lStartDir -text "Starting directory:"
entry .frameControl.eStartDir -background #FFFFFF -relief solid
# button .frameControl.bStartSearch -text "Display directory" \
#        -relief solid -command "fileDict /home/user/projects"
button .frameControl.bStartSearch -text "Display directory" \
       -relief solid -command "puts \[.frameControl.eStartDir get\]"

pack .frameControl.lStartDir -side left -anchor w
pack .frameControl.eStartDir -side left -fill x -expand yes \
     -after .frameControl.lStartDir -anchor w
pack .frameControl.bStartSearch -side left -after .frameControl.eStartDir \
     -anchor w

# В этом фрейме лежит метка с текущей обрабатываемой директорией
frame .frameInfo
pack .frameInfo -fill x

label .frameInfo.lInfo -background yellow -text "Directory: NONE" -relief solid
pack .frameInfo.lInfo -side left

listbox .lbTest -background #FFFFFF
pack .lbTest -fill both -expand yes

proc processSearch {inputListWidget} {
    for {set i 0} {$i < 10} {incr i} {
        $inputListWidget insert end "123"
        $inputListWidget insert end " 123"
        update
        for {set j 0} {$j < 10000000} {incr j} {set k [expr $j * $j]}
    }
}

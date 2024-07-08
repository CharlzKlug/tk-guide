#!/usr/bin/env tclsh
#Can you use the rename command to rename Tcl commands, such as while or for?
rename for newFor

newFor {set i 0} {$i < 10} {incr i} {puts $i}

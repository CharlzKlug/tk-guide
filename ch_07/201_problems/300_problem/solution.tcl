#!/usr/bin/env tclsh

# Write a procedure that will rename the following Tcl commands to new commands. Write a short script to test the new commands.
# if -> if,like
# for -> so
# expr -> fuzzyNumbers

proc procRen {} {
    uplevel {rename if if,like}
    uplevel {rename for so}
    uplevel {rename expr fuzzyNumbers}
}

procRen

if,like {0 < 1} {puts lower} {puts greater}
so {set i 0} {$i < 10} {incr i} {puts $i}
puts [fuzzyNumbers 5 + 6]

#!/usr/bin/env tclsh
# What Tcl command will return the argument list for a procedure?
proc myProc {arg1 arg2 arg3} {
    return [list $arg1 $arg2 $arg3]
}

puts [info args myProc]

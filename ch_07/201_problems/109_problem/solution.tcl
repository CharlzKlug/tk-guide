#!/usr/bin/env tclsh
# What Tcl command could be used to determine if a procedure has been defined?

puts "Procedure myProc does not exists: \"[info procs myProc]\""

puts "Make proc myProc"
proc myProc {} {
    return 42
}

puts "Procedure myProc exists: \"[info procs myProc]\""

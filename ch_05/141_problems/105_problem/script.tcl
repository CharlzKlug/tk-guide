#!/usr/bin/env tclsh
# What global variable contains a list of command line arguments?
# Use case:
# ./script.tcl mail 1 2 3
# mail 1 2 3
puts $argv

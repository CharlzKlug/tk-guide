#!/usr/bin/env tclsh

set fl [open "| ./reverse.tcl" "r+"]
puts $fl "Test string"
chan close $fl write
gets $fl str
close $fl

puts $str

#!/usr/bin/env tclsh
# What global variable can be used within a script to discover if the script is being evaluated on a Windows or UNIX platform?
puts $tcl_platform(platform)

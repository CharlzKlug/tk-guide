#!/usr/bin/env tclsh
# What Tcl command is used to create a new namespace?

namespace eval ns1 {
    proc fs1 {} {
	return 42
    }
}

puts [::ns1::fs1]

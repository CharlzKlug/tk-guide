#!/usr/bin/env tclsh

# 101. What command will modify a TclOO object?

oo::class create foo {
    method blah {} {
	puts "Blah procedure"
    }
}

foo create fooObj1
fooObj1 blah
try {fooObj1 tra} on error {em} {puts $em}

oo::objdefine fooObj1 method tra {} {puts "Tra method"}
fooObj1 tra

foo create fooObj2
try {fooObj2 tra} on error {em} {puts $em}

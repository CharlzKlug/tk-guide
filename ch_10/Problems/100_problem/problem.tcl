#!/usr/bin/env tclsh

# 100. What command will modify a TclOO class?

oo::class create foo {
    method blah {} {
	puts "Blah procedure"
    }
}

foo create fooObj1
fooObj1 blah
try {fooObj1 tra} on error {em} {puts $em}

oo::define foo method tra {} {puts "Tra method"}
fooObj1 tra

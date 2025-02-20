#!/usr/bin/env tclsh

oo::class create addition {
    method sum2 {inputA inputB} {
	return [expr {2 * ($inputA + $inputB)}]
    }
}

addition create myAdd

# Rename the sum2 method to twice
oo::define addition renamemethod sum2 twice
puts "Renamed to twice: [myAdd twice 1 2]\n"

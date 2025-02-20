#!/usr/bin/env tclsh

oo::class create addition {
    method add {inputA inputB} {
	return [expr {$inputA + $inputB}]
    }
}

# Add a forward to a global scope procedure
oo::define addition forward print puts
addition create myAdd
myAdd print "Hello!"

# Add a 'sum' method by re-using the 'add' method.
oo::define addition forward sum my add
puts "\"myAdd sum 4 5\": [myAdd sum 4 5]"

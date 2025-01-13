#!/usr/bin/env tclsh
source character.tcl

# Define a warrior that has better attack and defense
# skills because of its class

oo::class create warrior {
    superclass character
    variable State
    constructor {name} {
	puts "warrior constructor"
	next $name
	incr State(defense) 2
	incr State(attack) 2
    }
}

puts "Create object"
warrior create elmer siegfried

puts ""
puts "Show object"
elmer show

puts ""
puts "Attack value 8 against a warrior"
puts [elmer defense 8]

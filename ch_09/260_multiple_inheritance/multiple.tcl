#!/usr/bin/env tclsh
source character.tcl

oo::class create warrior {
    variable State
    constructor {name} {
	puts "Warrior constructor"
	next $name
	incr State(defense) 2
	incr State(attack) 2
    }
}

oo::class create human {
    variable State
    constructor {name} {
	puts "Human constructor"
	next $name
	incr State(hitpoints) 2
    }
}

oo::class create humanwarrior {
    superclass human warrior character
    variable State
    constructor {name} {
	puts "Human Warrior constructor"
	next $name
    }
}

puts "Creating a human warrior"
humanwarrior create elmer Sigfried

puts ""
puts "The character's attributes are:"
elmer show

puts ""
puts "Attack value 8 with no armor"
puts [elmer defense 8]

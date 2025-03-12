#!/usr/bin/env tclsh

# Define a character class with minimal methods.

oo::class create character {
    variable State
    constructor {nm} {
	array set State {defense 2 attack 2 hitpoints 5}
	set State(name) $nm
    }
    destructor {
	puts "$State(name) is gone"
    }
    method show {args} {
	parray State
    }
    method defense {attackStrength} {
	if {$attackStrength > $State(defense)} {
	    return "Hit"
	} else {
	    return "Miss"
	}
    }
}

# Create a character named Sigfried and
# give him a sing method
character create elmer Sigried

oo::objdefine elmer method cast {} {
    puts "Lightning Flash. Thunder Roar."
}

puts "The methods for the character class are:"
puts "	  [info class methods character]"

puts "The methods for the object elmer are:"
puts "	  [info object methods elmer]"

puts "All the methods for the object elmer are:"
puts "	  [info object methods elmer -all]"

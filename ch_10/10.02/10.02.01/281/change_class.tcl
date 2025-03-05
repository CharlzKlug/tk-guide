#!/usr/bin/env tclsh

# Create a base class with variables for name and
# a list of possession, and a general method for accessing
# the contents of class variables.

oo::class create character {
    variable possessions name

    constructor {nm args} {
	set name $nm
	set possessions $args
    }

    # Return the value of an object's variable
    # NOTE: No error checking. Variable must be valid.
    method get {id} {
	return [set $id]
    }
}

# Create a class for live characters.
# Derives from character.
# Includes a method for attacking
oo::class create liveCharacter {
    superclass character

    # Pass control to superclass constructor
    constructor {args} {
	next {*}$args
    }

    # Return attack strength
    method attackStrength {} {
	return 8
    }
}

# Create a class for dead characters.
# There is no constructor
# The attackStrength method returns a 0 for attack.
oo::class create deadCharacter {
    superclass character
    variable possessions

    method attackStrength {} {
	return 0
    }

    method takePossession {} {
	set taken [lindex $possessions 0]
	set possessions [lrange $possessions 1 end]
	return $taken
    }
}

set char1 [liveCharacter new Sigfreid Spear Tarnhelm]

puts "[$char1 get name] possesses [$char1 get possessions]"
puts "[$char1 get name] attacks with strength of [$char1 attackStrength]"

puts "After dieing,"
oo::objdefine $char1 class deadCharacter
puts "[$char1 get name] possesses [$char1 get possessions]"
puts "[$char1 get name] attacks with strength of [$char1 attackStrength]"
puts "Took [$char1 takePossession] from [$char1 get name]"
puts "Took [$char1 takePossession] from [$char1 get name]"

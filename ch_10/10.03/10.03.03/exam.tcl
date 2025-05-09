#!/usr/bin/env tclsh

# The base character class
oo::class create character {
    variable State
    constructor {nm} {
	array set State {defense 2 attack 2 hitpoints 5}
	set State(name) $nm
    }

    method defense {attackStrength} {
	if {$attackStrength > $State(defense)} {
	    return "Hit"
	} else {
	    return "Miss"
	}
    }
}

# A warrior gets better attack and defense skills
oo::class create warrior {
    superclass character

    variable State
    constructor {name} {
	puts "Warrior constructor"
	next $name
	incr State(defense) 2
	incr State(attack) 2
    }
}

puts "These classes subclass from character"
puts "	  [info class subclass character]"

puts "The superclass for warrior is"
puts "	  [info class superclass warrior]"

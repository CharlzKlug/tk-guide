#!/usr/bin/env tclsh
# Define a base character class with the default values
# for defensive strength, attack strength and life points

oo::class create character {
    variable state

    # Constructor assigns base values

    constructor {name} {
	puts "character constructor"
	array set state {defense 2 attack 3 hitpoints 5}
	set state(name) $name
    }

    # Display the values for debugging

    method show {} {
	parray state
    }

    # Return whether an attack is larger than character's
    # defensive ability

    method defense {attackStrength} {
	puts "Final Attack is: $attackStrength"
	if {$attackStrength > $state(defense)} {
	    return " $attackStrength is larger than $state(defense).\
$state(name) is Hit"
	} else {
	    return " $attackStrength is not larger than $state(defense).\
$state(name) is Missed"
	}
    }
}

set volan [character new "Volan"]
$volan show
puts [$volan defense 3]
puts [$volan defense 1]

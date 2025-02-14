oo::class create character {
    variable State

    # Constructor assigns base values

    constructor {name} {
	puts "character constructor"
	array set State {defense 2 attack 3 hitpoints 5}
	set State(name) $name
    }

    # Display the values for debugging

    method show {} {
	parray State
    }

    # Return whether an attack is larger than character's
    # defensive ability

    method defense {attackStrength} {
	puts "Final Attack is: $attackStrength"
	if {$attackStrength > $State(defense)} {
	    return " $attackStrength is larger than $State(defense).\
$State(name) is Hit"
	} else {
	    return " $attackStrength is not larger than $State(defense).\
$State(name) is Missed"
	}
    }
}

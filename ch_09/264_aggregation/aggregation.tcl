#!/usr/bin/env tclsh
# Define the character class
oo::class create character {
    variable State

    # This character has a name and a list of possessions
    constructor {nm} {
	set State(name) $nm
	set State(possessions) {}
    }

    # Display the contents of the State variable
    method show {} {
	parray State
    }

    # Acquire a new item by appending it to
    # the list of possessions
    method acquire {item} {
	lappend State(possessions) $item
    }

    # Return the total value of the treasures
    method netWorth {} {
	set total 0
	foreach item $State(possessions) {
	    incr total [$item getValue]
	}
	return $total
    }
}

# Define a treasure class
oo::class create treasure {

    # Treasures have a name and a value
    variable name value

    constructor {nm val} {
	set name $nm
	set value $val
   }

    # Return the value of this treasure
    method getValue {} {
	return $value
    }
}

# Create a character and create two treasures
# that the character has acquired.
character create daffy Allmine
daffy acquire [treasure new ruby 100]
daffy acquire [treasure new diamond 200]

puts "Daffy's State is:"
daffy show
puts "Allmine has treasure worth: [daffy netWorth]"

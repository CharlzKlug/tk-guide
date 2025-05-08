#!/usr/bin/env tclsh

# Define a class that can acquire and
# use potions

oo::class create character {
    variable State
    constructor {nm} {
	array set State {defense 2 attack 2 hitpoints 5}
	set State(name) $nm
	set State(possessions) {}
    }

    # Return the value of an element in the State
    method getParameter {param} {
	return $State($param)
    }

    # Add an object to the list of possessions
    method acquire {item} {
	lappend State(possessions) $item
    }

    # Internal method to return an object with a
    # name that matches the requested name
    method FindItem {name} {
	foreach item $State(possessions) {
	    if {[$item getName] eq $name} {
		return $item
	    }
	}
    }

    # Invoke the requested item's use method
    method use {name} {
	set item [my FindItem $name]
	$item use
    }

    # Invoke the requested item's drink method
    method drink {name} {
	set item [my FindItem $name]
	if {$item ne ""} {
	    $item drink State
	    set indx [lsearch $State(possessions) $item]
	    set State(possessions) [lreplace $State(possessions) $indx $indx]
	    $item destroy
	}
    }

    # Invoke the requested item's apply method
    method apply {name} {
	set item [my FindItem $name]
	lassign [$item apply] index value
	incr State($index) $value
    }
}

# Define a potion class
oo::class create potion {
    # name:		 Name of the potion
    # attribute:	 The character's attribute that is affected
    # modifier:	 The amount of effect on that attribute.

    variable name attribute modifier

    constructor {nm attr mod} {
	set name $nm
	set attribute $attr
	set modifier $mod
    }

    # Return a name
    method getName {} {
	return $name
    }

    # Apply a potion using the uplevel command
    method use {} {
	uplevel [list incr State($attribute) $modifier]
    }

    # Apply a potion using the upvar command
    method drink {varName} {
	upvar $varName localVar
	incr localVar($attribute) $modifier
    }

    # Return a potion's attribute and modifier
    method apply {} {
	return [list $attribute $modifier]
    }
}

character create elmer Siegfried
elmer acquire [potion new healing hitpoints 10]
elmer acquire [potion new strength attack 2]
elmer acquire [potion new dexterity defense 3]

puts "Before healing potion: [elmer getParameter hitpoints]"
elmer use healing
puts  "After healing potion: [elmer getParameter hitpoints]"
puts ""
puts "Before strength potion: [elmer getParameter attack]"
elmer drink strength
puts "After strength potion: [elmer getParameter attack]"

puts ""
puts "Before dexterity potion: [elmer getParameter defense]"
elmer apply dexterity
puts "After dexterity potion: [elmer getParameter defense]"

elmer drink strength

#!/usr/bin/env tclsh

oo::class create magicHelmet {
    method defense {attackStrength} {
	puts "Magic Helmet Reduces attack by 2"
	return [next [expr {$attackStrength - 2}]]
    }
}

oo::class create spear {
    method defense {attackStrength} {
	puts "Spear reduces attack by 2"
	return [next [expr {$attackStrength - 2}]]
    }
}

oo::class create warrior {
    mixin magicHelmet

    constructor {} {
	variable State
	array set State {defense 4 attack 4 hitpoints 5}
    }

    method defense {attackStrength} {
	variable State
	puts "Final Attack is: $attackStrength"
	if {$attackStrength > $State(defense)} {
	    return "Hit"
	} else {
	    return "Missed"
	}
    }
}

warrior create elmer

puts "With only a magic helmet"
puts "With a magic helmet elmer is [elmer defense 8]"

puts "\n Add a spear to the elmer object"
oo::objdefine elmer mixin spear
puts "With spear and magic helmet elmer is [elmer defense 8]"

puts [info class mixin warrior]
puts [info object mixin elmer]

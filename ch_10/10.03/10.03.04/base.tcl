#!/usr/bin/env tclsh

# The base character class
oo::class create character {
    variable State
    constructor {nm} {
	array set State {defense 2 attack 2 hipoints 5}
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

oo::class create magicHelmet {
    method defense {attackStrength} {
	puts "Magic Helmet Reduces attack by 2"
	return [next [expr {$attackStrength - 2}]]
    }
}

warrior create elmer Sigfried
oo::objdefine elmer mixin magicHelmet

puts "Class Mixins: [info class mixins warrior]"
puts "Elmer's Mixins: [info object mixins elmer]"

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

oo::class create shield {
    method defense {attackStrength} {
	puts "Shield reduces attack by 2"
	return [next [expr {$attackStrength - 2}]]
    }
}

oo::class create dagger {
    method defense {attackStrength} {
	puts "Dagger reduces attack by 1"
	return [next [expr {$attackStrength - 1}]]
    }
}

oo::class create humanwarrior {
    superclass human warrior character
    mixin shield dagger
    variable State
    constructor {name} {
	puts "Human Warrior constructor"
	next $name
    }
}

humanwarrior create elmer Sigfried

puts ""
puts "The characters attributes are:"
elmer show

puts ""
puts "Attack value 8 against human warrior with dagger and shield"
puts [elmer defense 8]

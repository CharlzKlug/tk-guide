#!/usr/bin/env tclsh
source character.tcl
source debug.tcl

oo::class create warrior {
    # Mix in the debug class and add the filter
    # mixin debug
    # filter showCall

    variable State
    constructor {name} {
	puts "Warrior constructor"
	next $name
	incr State(defense) 2
	incr State(attack) 2
    }
}

oo::class create human {
    # mixin debug
    # filter showCall
    variable State
    constructor {name} {
	puts "Human constructor"
	next $name
	incr State(hitpoints) 2
    }
}

oo::class create humanwarrior {
    mixin debug
    filter showCall

    superclass human warrior character
    variable State
    constructor {name} {
	puts "Human Warrior constructor"
	next $name
    }
}

humanwarrior create elmer Sigfried

elmer show
puts "Attack value 8 against human warrior"
puts [elmer defense 8]

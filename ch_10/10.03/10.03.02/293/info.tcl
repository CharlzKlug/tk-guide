#!/usr/bin/env tclsh

# Define a character class with minimal methods.

oo::class create character {
    variable State
    constructor {nm} {
	array set State {defense 2 attack 2 hitpoints 5}
	set State(name) $nm
    }
    destructor {
	puts "$State(name) is gone"
    }
    method show {args} {
	parray State
    }
    method defense {attackStrength} {
	if {$attackStrength > $State(defense)} {
	    return "Hit"
	} else {
	    return "Miss"
	}
    }
}

# Create a character named Sigfried and
# give him a sing method
character create elmer Sigried

oo::objdefine elmer method cast {} {
    puts "Lightning Flash. Thunder Roar."
}

puts "The methods for the character class are:"
puts "	  [info class methods character]"

puts "The methods for the object elmer are:"
puts "	  [info object methods elmer]"

puts "All the methods for the object elmer are:"
puts "	  [info object methods elmer -all]"

oo::define character forward attack attackStrength

proc attackStrength {} {
    return 8
}

puts "After adding forward, the methods for the character class are: "
puts "	  [info class methods character]"

oo::define character method inputTest {val} {
    if {![string is integer $val]} {
	set val 0
    }
    next $val
}

oo::define character filter inputTest

puts "After adding filter, the methods for the class are:"
puts "	  [info class methods character]"

puts "The filters defined for the character class are:"
puts "	 [info class filters character]"

proc defineClass {className} {
    puts "oo::class create class $className \{"

    foreach m [info class methods character] {
	switch [info class methodtype character $m] {
	    forward {
		set forwardTo [info class forward character $m]
		append cmds "\n# Method $m is forwarded to $forwardTo\n"
		append cmds "oo::define $className forward $m $forwardTo\n"
		set procArgs [info args $forwardTo]
		set procBody [info body $forwardTo]
		append cmds [list proc $m $procArgs $procBody]
	    }
	    method {
		puts "\n# Definition of method $m"
		puts "method $m [info class definition character $m]"
	    }
	}
    }
    puts "\}"

    puts "\n# These filters are defined for $className"
    foreach f [info class filters $className] {
	puts "oo::define character filter $f"
    }

    puts "\n # These forwards are defined for $className"
    puts $cmds
}

puts "Full definition [defineClass character]"

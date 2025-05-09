#!/usr/bin/env tclsh

oo::class create Show {
    method display {} {
	my variable State
	return $State
    }
}

oo::class create Base {
    variable State
    mixin Show
}

oo::class create Deriv {
    superclass Base
    method setState {inputSt} {
	variable State
	set State $inputSt
    }
}

Deriv create derivObj1
derivObj1 setState 34.6xkd

Deriv create derivObj2
derivObj2 setState 77

puts "derivObj1 displays: [derivObj1 display]"
puts "derivObj2 displays: [derivObj2 display]"

oo::objdefine derivObj1 {
    method Log args {
	if {[self target] == "::Deriv setState"} {
	    if {[string is int $args]} {
		next {*}$args
	    } {error "\"$args\" is not an integer!"}
	} {
	    next {*}$args
	}
    }
    filter Log
}

puts "Set to derivObj1 State to 12"
derivObj1 setState 12
puts "derivObj1 displays: [derivObj1 display]"

puts "Set to derivObj1 State to 'hello'"
if {[catch {derivObj1 setState hello} {puts Error!} err]} {
    puts "I can't set State to hello!"
}

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
derivObj1 setState 34

Deriv create derivObj2
derivObj2 setState 77

puts "derivObj1 displays: [derivObj1 display]"
puts "derivObj2 displays: [derivObj2 display]"

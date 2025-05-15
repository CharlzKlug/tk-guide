#!/usr/bin/env tclsh

proc ::oo::Helpers::classvar {args} {
    # Get reference to class's namespace
    set nsCl [info object namespace [uplevel 1 {self class}]]
    set nsObj [uplevel 1 {namespace current}]
    # Link variables into local (caller's) scope
    foreach v $args {
	uplevel "my variable $v"
	upvar #0 ${nsCl}::$v ${nsObj}::$v
    }
}

oo::class create Foo {
    constructor {} {
	classvar quantity
	# Initialize quantity the first time a limitedItem is created
	if {![info exists quantity]} {
	    set quantity 1
	} {
	    incr quantity
	}
    }
    method getQuantity {} {
	my variable quantity
	return $quantity
    }
    destructor {
	my variable quantity
	incr quantity -1
    }
}

Foo create fooObj
puts [fooObj getQuantity]

Foo create fooObjTwo
puts [fooObjTwo getQuantity]

Foo create fooObjThree
puts [fooObjThree getQuantity]

fooObjThree destroy
puts [fooObj getQuantity]

fooObjTwo destroy
puts [fooObj getQuantity]

fooObj destroy

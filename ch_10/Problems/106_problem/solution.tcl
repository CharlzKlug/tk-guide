#!/usr/bin/env tclsh

oo::class create foo {
    variable A B

    constructor {} {
	set A 42
	set B 43
    }
    method getA {} {
	return $A
    }
    method getB {} {
	return $B
    }
}

foo create obj1
puts [obj1 getA]
puts [obj1 getB]
puts [info object vars obj1]

::oo::objdefine obj1 variable C
::oo::objdefine obj1 method setC {} {set C 11}
::oo::objdefine obj1 method getC {} {return $C}
obj1 setC
puts [obj1 getC]
puts [info object variables obj1]

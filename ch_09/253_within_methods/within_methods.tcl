#!/usr/bin/env tclsh
oo::class create hasMethods {
    variable value
    constructor {val} {
	set value $val
    }

    method showValue {} {
	puts "Value is: $value"
    }

    method external {objName} {
	$objName showValue
    }

    method internal {} {
	my showValue
    }
}

set ob1 [hasMethods new 1]
set ob2 [hasMethods new 2]

$ob1 external $ob2
$ob1 internal

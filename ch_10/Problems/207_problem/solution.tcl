#!/usr/bin/env tclsh

set threshold 10

oo::class create operations {
    variable threshold
    constructor {inputThresh} {
	set threshold $inputThresh
    }
    method add {inputA inputB} {
	return [expr $inputA + $inputB]
    }
    method sub {inputA inputB} {
	return [expr $inputA - $inputB]
    }
    method check args {
	foreach arg $args {
	    if {$arg > $threshold} {
		error "Too big value $arg!"
	    }
	}
	set result [next {*}$args]
	if {$result < 0} {
	    set result 0
	}
	return $result
    }
    filter check
}

operations create oper $threshold
puts [oper add 2 3]
puts [oper sub 2 3]

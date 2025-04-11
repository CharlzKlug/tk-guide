#!/usr/bin/env tclsh

oo::class create foo {
    constructor {inputVal} {
	puts "Launched foo constructor. Val: $inputVal."
    }
}

oo::class create bar {
    superclass foo
    constructor {inputVal} {
	puts "Launched bar constructor. Val: $inputVal."
	next $inputVal
    }
}

bar create objB 13

#!/usr/bin/env tclsh

oo::class create spice {
    method bar {} {
	puts "Hello, Bar! It's me [info object namespace [self]]!"
    }
}

oo::class create foo {
}

foo create fooObj01
foo create fooObj02
oo::define foo mixin spice
fooObj01 bar
fooObj02 bar

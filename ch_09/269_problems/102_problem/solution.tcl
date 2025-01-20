#!/usr/bin/env tclsh

oo::class create MyClass {

    method foo {} {
	puts "This is method foo"
    }

    method bar {} {
	puts "This is method bar"
    }
}

MyClass create my_object
my_object foo
my_object bar

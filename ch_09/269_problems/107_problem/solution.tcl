#!/usr/bin/env tclsh

# 107 What command can be added to a class definition
# to preprocess arguments before any method is evaluated?


oo::class create Foo {
    method testMethod {args} {
	puts "Test method"
	if {[llength $args] < 3} {
	    return
	}
	next {*}$args
    }
}

oo::class create Bar {
    mixin Foo
    filter testMethod
    method methodBlah {args} {
	puts "Method Blah"
	puts "Arguments $args"
    }
}

Bar create barObject
puts "Probing methodBlah with \"1\""
barObject methodBlah 1
puts "Probing methodBlah with \"1 2 3\""
barObject methodBlah 1 2 3

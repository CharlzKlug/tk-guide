#!/usr/bin/env tclsh

# 103. What command adds a mixin to an object?

oo::class create foo {
    method foo {} {
	puts "It's foo method."
    }
}

foo create obj1
obj1 foo

oo::class create bar {
    method foo {} {
	puts "It's a mixin foo method"
	next
    }
}

oo::objdefine obj1 mixin bar
obj1 foo

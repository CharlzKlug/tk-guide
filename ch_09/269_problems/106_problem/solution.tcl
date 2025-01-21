#!/usr/bin/env tclsh

oo::class create FooClass {
    method some_method {} {
	puts "FooClass's some_method"
    }
}

oo::class create BarClass {
    mixin FooClass
}

BarClass create bar_object
bar_object some_method

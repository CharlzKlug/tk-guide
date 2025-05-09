#!/usr/bin/env tclsh

oo::class create foo {
    filter filterA
    method fooMethod {} {puts "This is the fooMethod"}
    method fooMethod2 {} {puts "This is the fooMethod2"}
    method filterA {} {
	puts "This is filter"
	next
    }
}

foo create fooObj
fooObj fooMethod
fooObj fooMethod2

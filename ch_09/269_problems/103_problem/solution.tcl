#!/usr/bin/env tclsh

oo::class create Ancestor {
    method foo {} {
	puts "This is ancestor's method foo"
    }
}

oo::class create Descendant {
    superclass Ancestor
    method foo {} {
	puts "This is descendant's method foo"
	next
    }
}

Descendant create descendant
descendant foo

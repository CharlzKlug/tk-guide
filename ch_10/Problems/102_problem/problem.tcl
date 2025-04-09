#!/usr/bin/env tclsh

# 102. What command returns the list of a classes superclasses?

oo::class create ancestor {
    method blah {} {
	puts "Ancestor's blah method"
    }
}

oo::class create descestorA {
    superclass ancestor
    method foo {} {
	puts "Descestor's foo method"
    }
}

descestorA create desc1
desc1 blah
desc1 foo

puts "[info class superclasses descestorA]"

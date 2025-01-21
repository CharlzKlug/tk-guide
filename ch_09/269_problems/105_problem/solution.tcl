#!/usr/bin/env tclsh
oo::class create Ancestor {
    method foo {} {
	puts "Foo method"
    }
    method bar {} {
	puts "Bar method"
    }
}

oo::class create Descestor {
    superclass Ancestor
}

Descestor create object_descestor
object_descestor foo
object_descestor bar

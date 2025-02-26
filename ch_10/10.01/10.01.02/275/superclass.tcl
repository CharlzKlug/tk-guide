#!/usr/bin/env tclsh

oo::class create foo {
    constructor {} {
	puts Foo!
    }
}

oo::class create bar {}
oo::define bar superclass foo
oo::define bar constructor {} {puts Bar!; next}
bar create bar2

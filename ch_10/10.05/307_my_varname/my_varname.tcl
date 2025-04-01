#!/usr/bin/env tclsh

oo::class create withTrace {
    variable var1 var2
    constructor {} {
	set var1 2
	set var2 2
	trace add variable [my varname var1] write showVar
	trace add variable [my varname var2] write [list [self] showVar]
	puts "Full path for var1 is: [my varname var1]"
    }
    method decrVar1 {} {
	incr var1 -1
    }
    method decrVar2 {} {
	incr var2 -2
    }
    method showVar {name index operation} {
	upvar $name vv
	puts "Method shows new value for $name is $vv"
    }
}

proc showVar {name index operation} {
    upvar $name vv
    puts "Global proc shows new value for $name is $vv"
}

withTrace create test
test decrVar1
test decrVar2

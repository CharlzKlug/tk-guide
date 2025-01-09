#!/usr/bin/env tclsh
oo::class create methods {
    variable var1 var2

    constructor {val1 val2} {
	set var1 $val1
	set var2 $val2
    }

    method show {} {
	puts "Show: VAR1: $var1 VAR2: $var2"
    }

    method HiddenShow {} {
	puts "HiddenShow: VAR1: $var1 VAR2: $var2"
    }
}
methods create m 1 2
m show
m HiddenShow

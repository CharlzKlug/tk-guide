#!/usr/bin/env tclsh

proc ::oo::Helpers::classvar {args} {
    # Get reference to class's namespace
    set nsCl [info object namespace [uplevel 1 {self class}]]
    set nsObj [uplevel 1 {namespace current}]
    # Link variables into local (caller's) scope
    foreach v $args {
	uplevel "my variable $v"
	upvar #0 ${nsCl}::$v ${nsObj}::$v
    }
}

oo::class create limitedItem {
    constructor {} {
	classvar quantity
	# Initialize quantity the first time a limitedItem is created
	if {![info exists quantity]} {
	    set quantity 1
	}
	if {$quantity > 2} {
	    error "Too many magical items"
	}
	incr quantity
    }
}

set magicRings ""

foreach ring {diamond ruby amethyst emerald garnet gold silver} {
    if {[expr {rand()}] > .5} {
	set fail [catch {limitedItem create $ring} rtn]
	if {!$fail} {
	    lappend magicRings $rtn
	} else {
	    puts "FAILED: $rtn"
	}
    }
}

puts "Defined $magicRings rings"

#!/usr/bin/env tclsh

catch {limitedItem destroy}

proc ::oo::Helpers::classvar {args} {
    # Get reference to class s namespace
    set nsCl [info object namespace [uplevel 1 {self class}]]
    set nsObj [uplevel 1 {namespace current}]
    # Link variables into local (caller's) scope
    foreach v $args {
	uplevel "my variable $v"
	upvar #0 ${nsCl}::$v ${nsObj}::$v
    }
}

proc ::oo::define::classmethod {name {args ""} {body ""}} {
    # Create the method on the class if the caller gave
    # arguments and body
    if {[llength [info level 0]] == 4} {
	uplevel 1 [list self method $name $args $body]
    }
    # Get the name of the class being defined
    set cls [lindex [info level -1] 1]
    # Make connection to private class "my" command by
    # forwarding
    uplevel forward $name [info object namespace $cls]::my $name
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
	puts "Constructor [my varname quantity] - $quantity"
    }
    classmethod decreaseCount {} {
	variable quantity
	puts "Original quantity value is: $quantity"
	incr quantity -1
	puts "New quantity value is: $quantity"
    }
}

limitedItem new
limitedItem decreaseCount

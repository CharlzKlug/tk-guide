#!/usr/bin/env tclsh

oo::class create character {
    variable State
    constructor {} {
	array set State {attack 2}
    }
}

character create elmer

oo::objdefine elmer method config {name args} {
    if {[set p [string first "(" $name]] > 0} {
	incr p -1
	set varName [string range $name 0 $p]
    } else {
	set varName $name
    }
    variable $varName
    if {$args ne ""} {
	set $name {*}$args
    }
    return [set $name]
}

puts [elmer config State(attack)]
puts [elmer config State(attack) 6]

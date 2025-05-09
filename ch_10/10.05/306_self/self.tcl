#!/usr/bin/env tclsh

oo::class create timer {
    variable interval repeat
    constructor {int rpt} {
	set interval $int
	set repeat $rpt
	puts "Registering [self] for a $interval ms callback"
	after $interval [list [self] \
			     alert "$interval milliseconds have elapsed"]
    }
    method alert {msg} {
	puts $msg
	if {$repeat} {
	    after 1000 [list [self] alert "You've missed the alert!"]
	}
    }
}

timer create twoSeconds 2000 0

vwait forever

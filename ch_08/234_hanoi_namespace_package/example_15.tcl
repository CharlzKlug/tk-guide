#!/usr/bin/env tclsh
::tcl::tm::path add .
package require stackCmds

namespace eval Hanoi {
    stackCmds createStack left
    stackCmds createStack center
    stackCmds createStack right

    ####
    # proc moveRing {from to} --
    #	Move the last element of the "from" stack
    #	to the end of the "to" stack.
    #
    # Arguments
    #	from: The name of the stack to move from.
    #	to: The name of the stack to move to.
    # Results
    #	The "from" and "to" stacks are modified.
    proc moveRing {from to} {
	$to push [$from pop]
    }

    proc show {} {
	puts ""
	for {set p 4} {$p >= 0} {incr p -1} {
	    set out ""
	    foreach stack {left center right} {
		set ring [$stack peek $p]
		if {$ring ne ""} {
		    set l [format %5s [string repeat - $ring]]
		    set r [format %-5s [string repeat - $ring]]
		} else {
		    set l [format %5s " "]
		    set r $l
		}
		append out [format %s%s%s $l "||" $r]
	    }
	    puts $out
	}
	puts ""
    }

    proc start {} {
	variable left
	# Fill the left stack
	for {set i 4} {$i > 0} {incr i -1} {
	    left push $i
	}
    }

    proc done {} {
	if {[right size] == 4} {
	    return 1
	} else {
	    return 0
	}
    }
}
Hanoi::start

array set abbr {l left r right c center}
while {![Hanoi::done]} {
    Hanoi::show
    puts -nonewline "From (lcr): "
    flush stdout
    set from [gets stdin]
    puts -nonewline "To (lcr): "
    flush stdout
    set to [gets stdin]
    Hanoi::moveRing $abbr($from) $abbr($to)
}

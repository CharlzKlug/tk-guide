#!/usr/bin/env tclsh

namespace eval foo {
    namespace eval bar {
	namespace eval and {
	    namespace eval grill {
	    }
	}
    }
}

namespace eval ::foo::bar::and {namespace eval grill {
    puts "Current namespace is [namespace current]"
}
}

namespace eval stackCmds {
    proc push {name val} {
	upvar $name stack
	lappend stack $val
    }

    proc peek {name {pos end}} {
	upvar $name stack
	return [lindex $stack $pos]
    }

    proc size {name} {
	upvar $name stack
	return [llength $stack]
    }

    proc pop {name} {
	upvar $name stack
	set rtn [lindex $stack end]
	set stack [lrange $stack 0 end-1]
	return $rtn
    }
}

set stackDef {
    # Stack variable is maintained in each stack
    variable stack {}

    # Commands are taken from stackCmd namespace
    namespace ensemble create -map [list \
					peek "::stackCmds::peek [namespace current]::stack" \
					size "::stackCmds::size [namespace current]::stack" \
					push "::stackCmds::push [namespace current]::stack" \
					pop "::stackCmds::pop [namespace current]::stack"]
}

namespace eval Hanoi {
    namespace eval left $stackDef
    namespace eval center $stackDef
    namespace eval right $stackDef

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

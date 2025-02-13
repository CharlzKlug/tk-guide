#!/usr/bin/env tclsh

# 301. Add a 'shuffle' method to the deck of cards class created for
# exercise 300.

# 300. Define a deck of cards class that inherits from the stack class in
# exercise 201 and the card class from 204. The deck class will need a
# destructor to destroy the cards when a deck is destroyed.

source stack.tcl
source card.tcl

oo::class create CardsDeck {
    superclass stack
    variable stackVar

    constructor {} {}
    destructor {
	while {[my size] > 0} {
	    set item [my pop]
	    $item destroy
	}
    }
    method shuffle {} {
	set innerStackList $stackVar
	set shuffledStackList {}
	while {[llength $innerStackList] > 0} {
	    set index [expr {int(rand() * [llength $innerStackList])}]
	    set elem [lindex $innerStackList $index]
	    lappend shuffledStackList $elem
	    set innerStackList [lreplace $innerStackList $index $index]
	}
	set stackVar $shuffledStackList
    }
}

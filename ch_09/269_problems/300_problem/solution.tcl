#!/usr/bin/env tclsh

# 300. Define a deck of cards class that inherits from the stack class in
# exercise 201 and the card class from 204. The deck class will need a
# destructor to destroy the cards when a deck is destroyed.

source stack.tcl
source card.tcl

oo::class create CardsDeck {
    superclass stack
    constructor {} {
	set myCard [Card new Club 2]
	my push $myCard
    }
    destructor {
	if {[my size] > 0} {
	    set item [my pop]
	    $item destroy
	    puts "destroyed $item"
	}
    }
}

CardsDeck create myDeck
myDeck destroy

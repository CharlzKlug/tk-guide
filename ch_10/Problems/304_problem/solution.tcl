#!/bin/sh
# \
    exec tclsh "$0" "$@"

source classes.tcl

oo::class create library {
    variable Books
    constructor {} {
	set Books {}
    }
    method addBook {inputBook} {
	lappend Books $inputBook
    }
    method searchByTitle {inputTitle} {
	set result {}
	foreach book $Books {
	    lappend result $book
	}
	return $result
    }
}

library create cornwellLibrary

author create mTwain "Mark Twain"
book create tomSawyer "The adventures of Tom Sawyer" mTwain
book create heckFinn "Adventures of Huckleberry Finn" mTwain

cornwellLibrary addBook tomSawyer
puts [cornwellLibrary searchByTitle "blah"]

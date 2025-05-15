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
	foreach bookObj $Books {
	    if {[string match *$inputTitle* [$bookObj getTitle]]} {
		   lappend result $bookObj
	       }
	}
	return $result
    }
    method searchByAuthor {inputAuthor} {
	set result {}
	foreach bookObj $Books {
	    if {[string match *$inputAuthor* [[$bookObj getAuthor] getName]]} {
		   lappend result $bookObj
	       }
	}
	return $result
    }
}

proc book2String {inputBook} {
    return "[$inputBook getTitle] --- [[$inputBook getAuthor] getName]"
}

library create cornwellLibrary

author create mTwain "Mark Twain"
book create tomSawyer "The adventures of Tom Sawyer" mTwain
book create heckFinn "Adventures of Huckleberry Finn" mTwain

cornwellLibrary addBook tomSawyer
cornwellLibrary addBook heckFinn

author create lTolstoy "Lev Tolstoy"
book create warNPeace "War and Peace" lTolstoy
cornwellLibrary addBook warNPeace

puts "Search by Title \"Tom\":"
foreach bookObj [cornwellLibrary searchByTitle "Tom"] {
    puts [book2String $bookObj]
}

puts {}
puts "Search by author name \"Mark\":"
foreach bookObj [cornwellLibrary searchByAuthor Mark] {
    puts [book2String $bookObj]
}

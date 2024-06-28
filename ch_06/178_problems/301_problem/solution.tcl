#!/usr/bin/env tclsh
# Write a script that will accept multiple lines in the form "author, title", and will create a list author, title, author, title...
# Clif Flynt, Tcl/Tk: A Developer's Guide
# Richard Stevens, TCP/IP Illustrated
# Donald Knuth, The Art of Computer Programming: Vol 1
# Donald Knuth, The Art of Computer Programming: Vol 2
# Donald Knuth, The Art of Computer Programming: Vol 3
# John Ousterhout, Tcl and the Tk Toolkit
# Richard Stevens, Unix Network Programming
# Convert the list to an associative array that would allow you to get lists of books by an author.

set authorTitleList {}

proc string-to-list {inputString} {
    set splittedString [split $inputString ,]
    set author [string trim [lindex $splittedString 0]]
    set title [string trim [lindex $splittedString 1]]
    upvar 1 authorTitleList authorTitleList
    lappend authorTitleList $author $title
}

set authorsArray [dict create]

proc list2assoc {inputList} {
    upvar 1 authorsArray authorsArray
    foreach {author title} $inputList {
	dict lappend authorsArray $author $title
    }
}

string-to-list "Clif Flynt, Tcl/Tk: A Developer's Guide"
string-to-list "Richard Stevens, TCP/IP Illustrated"
string-to-list "Donald Knuth, The Art of Computer Programming: Vol 1"
string-to-list "Donald Knuth, The Art of Computer Programming: Vol 2"
string-to-list "Donald Knuth, The Art of Computer Programming: Vol 3"
string-to-list "John Ousterhout, Tcl and the Tk Toolkit"
string-to-list "Richard Stevens, Unix Network Programming"
list2assoc $authorTitleList

foreach author [dict keys $authorsArray] {
    puts ""
    puts $author
    foreach title [dict get $authorsArray $author] {
	puts "    $title"
    }
}

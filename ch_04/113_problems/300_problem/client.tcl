#!/usr/bin/env tclsh

puts "Welcome to the client software!"

puts -nonewline "Please enter IP-address: "
flush stdout
set IPAddress [gets stdin]

puts -nonewline "Please enter port number: "
flush stdout
set Port [gets stdin]

set ClientSocket [socket $IPAddress $Port]
while {![eof $ClientSocket]} {
    set LineFromSocket [gets $ClientSocket]
    puts $LineFromSocket
    flush stdout
    
    if {![eof $ClientSocket]} {
	set UserInput [gets stdin]
	
	puts $ClientSocket "$UserInput"
	flush $ClientSocket
	
	set Answer [gets $ClientSocket]
	puts $Answer
    }
}

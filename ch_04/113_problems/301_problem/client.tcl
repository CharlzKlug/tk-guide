#!/usr/bin/env tclsh

proc readFromSocket {clientSocket} {
    while {![eof $clientSocket]} {
	gets $clientSocket someMessage
	puts $someMessage
    }
}

puts "Welcome to the client software!"

puts -nonewline "Please enter IP-address: "
flush stdout
set IPAddress [gets stdin]

puts -nonewline "Please enter port number: "
flush stdout
set Port [gets stdin]

set ClientSocket [socket $IPAddress $Port]
while {![eof $ClientSocket]} {
    readFromSocket $ClientSocket
    set userInput [gets stdin]
    puts $ClientSocket $userInput
    flush $ClientSocket
}

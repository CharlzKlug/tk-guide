#!/usr/bin/env tclsh

proc readFromSocket {clientSocket} {
    while {![eof $clientSocket]} {
	gets $clientSocket someMessage
	puts $someMessage
    }
}

puts "Welcome to the client software!"

set IPAddress [lindex $argv 0]
set Port [lindex $argv 1]

puts "IPAddress: $IPAddress"
puts "Port: $Port"

set ClientSocket [socket $IPAddress $Port]
while {![eof $ClientSocket]} {
    puts "Please, enter some numbers"
    set userInput [gets stdin]
    puts $ClientSocket $userInput
    flush $ClientSocket
    readFromSocket $ClientSocket
}

#!/usr/bin/env tclsh

proc serverOpen {channel addr port} {
    puts "New connection: address: $addr, port: $port"
    dialog $channel
    close $channel
}

proc dialog {inputChannel} {
    set finishDialog false
    while {!$finishDialog} {
	puts $inputChannel "Please, enter your word:"
	flush $inputChannel
	gets $inputChannel someWord
	if {$someWord eq "quit"} {
	    set finishDialog true
	}
	puts $inputChannel "Answer: [string reverse $someWord]"
    }
}

set serverPort 12345
set server [socket -server serverOpen $serverPort]
set done 0
vwait done

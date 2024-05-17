#!/usr/bin/env tclsh

proc revert {inputSentence} {
    set result {}
    for {set i [expr {[llength $inputSentence] - 1}]} {$i > -1} \
	{incr i -1} {
	lappend result [lindex $inputSentence $i]
    }
    return $result
}

proc serverOpen {channel addr port} {
    puts "New connection: address: $addr, port: $port"
    dialog $channel
    close $channel
}

proc dialog {inputChannel} {
    set finishDialog false
    while {!$finishDialog} {
	puts $inputChannel "Please, enter your sentence:"
	flush $inputChannel
	gets $inputChannel inputSentence
	if {$inputSentence eq "quit"} {
	    set finishDialog true
	}
	puts $inputChannel "Answer: [revert $inputSentence]"
    }
}

set serverPort 12345
set server [socket -server serverOpen $serverPort]
set done 0
vwait done

#!/usr/bin/env tclsh

oo::class create Beat {
    variable fileId
    constructor {inputFileName} {
	if {[catch {set fileId [open $inputFileName "a"]} err]} {
	    error "Error: $err"
	}
    }
    method printTimeStamp {inputMessage} {
	puts "[clock format [clock seconds]]: heartbeat"
	puts $fileId
	puts $fileId "[clock format [clock seconds]]: $inputMessage"
    }
    method heartbeat {} {
	after 0 [list [self] printTimeStamp heartbeat]
	after 10000 [list [self] heartbeat]
    }
    destructor {
	puts Destroing...
	close $fileId
    }
}

Beat create myBeat "info.txt"
# myBeat printTimeStamp hello
myBeat heartbeat
after 20000 [list set forever 1]
vwait forever
myBeat destroy

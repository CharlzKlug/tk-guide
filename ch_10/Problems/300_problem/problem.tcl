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
	chan puts $fileId "[clock format [clock seconds]]: $inputMessage"
    }
    method heartbeat {} {
	my printTimeStamp heartbeat
	after 10000 [list [self] heartbeat]
    }
    destructor {
	puts Destroing...
	close $fileId
    }
}

Beat create myBeat "info.txt"
myBeat printTimeStamp hello
myBeat heartbeat
vwait forever
myBeat destroy

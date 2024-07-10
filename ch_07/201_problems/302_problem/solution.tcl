# Given a procedure report {data} {...} that uses puts to print a report to the screen, write a short script to create a new procedure reportFile {data outputChannel} that will send and identical report to an open Tcl channel.

proc report {data} {
    foreach item $data {
	puts $item
    }
}

proc reportFile {data outputChannel} {
    foreach item $data {
	puts $outputChannel $item
    }
}

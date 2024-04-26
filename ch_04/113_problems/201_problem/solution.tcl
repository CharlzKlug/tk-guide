#!/usr/bin/env tclsh

proc words_count {line} {
    return [llength $line]
}

proc process_files {inputFile outputFile} {
    if {![file exists $inputFile]} {
	error "File $inputFile does not exists!"
    }

    try {
	set rfd [open $inputFile "r"]
    } trap {} {} {
	error "Can't open $inputFile for read!"
    }

    if {[gets $rfd inputLine] < 0} {
	error "Can't read line from $inputFile!"
    }

    close $rfd
    
    try {
	set wfd [open $outputFile "w"]
    } trap {} {} {
	error "Can't open $outputFile for write!"
    }

    puts $wfd [words_count $inputLine]

    close $wfd
}

if {$argc != 2} {
    puts "You must specify two files: inputFile and outputFile"
    exit 1
}

catch {process_files [lindex $argv 0] [lindex $argv 1]} errMsg options
return -options $options $errMsg

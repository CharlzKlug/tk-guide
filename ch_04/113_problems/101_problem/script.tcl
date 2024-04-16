#!/usr/bin/env tclsh

proc read_file {fileName} {
    set fd [open $fileName r]

    while {![eof $fd]} {
	gets $fd lsLine
	puts $lsLine
    }
    close $fd
}

puts "Read with short name: 1.txt"
read_file "1.txt"
set longName [file normalize 1.txt]
puts "Read with long name: $longName"
read_file $longName

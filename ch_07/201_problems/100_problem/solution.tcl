#!/usr/bin/env tclsh
proc myformat {formatString args} {
    return [format $formatString {*}$args]
}

puts [myformat "%d - %d hi!!!" 34 42]

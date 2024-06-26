#!/usr/bin/env tclsh
set ordersDict [dict create]

proc process {inputQuery} {
    upvar 1 ordersDict ordersDict
    set table [lindex $inputQuery 0]
    set meal [lindex $inputQuery 1]
    set opts [lindex $inputQuery 2]
    if {$meal == {Complete} && $opts == {}} {puts complete}
}

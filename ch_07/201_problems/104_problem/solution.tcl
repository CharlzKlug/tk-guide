#If procA invokes procB, can procA local variables be accessed from procB?
proc procA {} {
    set varA 42
    procB
    puts $varA
}

proc procB {} {
    upvar varA newA
    puts "From procB: $newA"
    set newA 49
}

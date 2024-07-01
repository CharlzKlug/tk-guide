#!/usr/bin/env tclsh
proc alpha {} {
    return "This is the alpha proc"
}

# Example Script
puts "Invocation of procedure alpha: [alpha]"
rename alpha beta
catch alpha rtn
puts "Invocation of alpha after rename: $rtn"
puts "Invocation of procedure beta: [beta]"
rename beta ""
beta

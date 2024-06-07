proc multiSplit {inputExp inputString} {
    set result {}
    while {[string length $inputString]} {
	if {[regexp -indices -- $inputExp $inputString regIndices]} {
	    set tmpSubStr [string range $inputString 0 [expr [lindex $regIndices 0] - 1]]
	    lappend result $tmpSubStr
	    set inputString [string range $inputString [expr [lindex $regIndices 1] + 1] end]
	} else {
	    lappend result $inputString
	    set inputString ""
	}
    }
    return $result
}

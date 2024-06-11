# Modify the procedure from the previous exercise to return the indices of the elements that match the two patterns when the elements are adjacent. This may not be the first occurence of either element.

proc two-pattern {inputList inputPattern1 inputPattern2} {
    set matchIndicesList {}
    for {set i 0} {$i < [expr [llength $inputList] - 1]} {incr i 1} {
	set item1 [lindex $inputList $i]
	set iPlus [expr $i + 1]
	set item2 [lindex $inputList $iPlus]
	if {[regexp $inputPattern1 $item1] &
	    [regexp $inputPattern2 $item2]} {
	    lappend matchIndicesList $i $iPlus
	}
    }
    return $matchIndicesList
}

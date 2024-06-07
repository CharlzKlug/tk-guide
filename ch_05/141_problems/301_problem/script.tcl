# Write a procedure that will accept a list and return the longest element in that list.
proc get-longest-elem {inputList} {
    set result ""
    foreach item $inputList {
	if {[string length $item] > [string length $result]} {
	    set result $item
	}
    }
    return $result
}

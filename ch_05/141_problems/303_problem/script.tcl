# Modify the procedure from the previous exercise to return the Nth list element that matches a pattern, instead of the Nth index.

proc get-nth-elem {inputList inputPattern inputNth} {
    set indicesList [lsearch -all $inputList $inputPattern]
    set index [lindex $indicesList [expr $inputNth - 1]]
    if {$index > 0} {
	return [lindex $inputList $index]
    }
}

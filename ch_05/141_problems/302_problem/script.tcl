# The lsearch command will return the index of the first match to a pattern. Write a procedure that will return the index of the Nth match. The procedure should accept a list, pattern, and integer to define which match to return.
proc get-nth-index {inputList inputPattern inputNth} {
    set indicesList [lsearch -all $inputList $inputPattern]
    return [lindex $indicesList [expr $inputNth - 1]]
}

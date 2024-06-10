# Write a procedure that will accept a list and two patterns and return a list of the indices for the element that matches the first pattern followed by the element that matches the second pattern.

proc two-pattern {inputList inputPattern1 inputPattern2} {
    set lst [lsearch -all $inputList $inputPattern1]
    set elem [lsearch -inline $inputList $inputPattern2]
    lappend lst $elem
    return $lst
}

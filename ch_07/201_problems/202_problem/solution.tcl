# Write a procedure that will duplicate the functionality of the incr command using the upvar command.
proc my-incr {inputVariable {step 1}} {
    upvar 1 $inputVariable myVar
    set myVar [expr {$myVar + $step}]
}

proc my-incr {inputVariable {step 1}} {
    upvar 1 $inputVariable myVar
    set myVar [expr {$myVar + $step}]
}

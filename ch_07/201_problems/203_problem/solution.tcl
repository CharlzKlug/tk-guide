# Write a procedure that will duplicate the functionality of the incr command using the uplevel command.
proc my-incr {inputVariable {step 1}} {
    uplevel 1 [list incr $inputVariable $step]
}

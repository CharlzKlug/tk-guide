#!/usr/bin/env tclsh

# Write a procedure that will create simple objects. The procedure should accept a variable name, value, and body to evaluate when the variable's procedure is invoked.

proc cso {inputName inputValue inputBody} {
    uplevel "proc $inputName {$inputValue} {$inputBody}"
}

cso testName testVal {puts [expr $testVal + 1]}
testName 45

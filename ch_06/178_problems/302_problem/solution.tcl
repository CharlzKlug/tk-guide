#!/usr/bin/env tclsh
# Write a "Safe Math" procedure that will accept a mathematical expression, and evaluate it and return the result without generating an error. If any of the values in the math expression are illegal, return the phrase "Illegal Expression" instead of a numeric answer.

proc safe-math {inputExpression} {
    set errorVal [catch {set result [expr $inputExpression]}]
    if {$errorVal} {return "Illegal Expression"}
    return $result
}

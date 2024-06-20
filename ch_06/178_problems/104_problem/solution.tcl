#!/usr/bin/env tclsh
# The code fragment 'set result [expr $numerator / $divisor]' will fail if the numerator or divisor is an illegal value. Write a code fragment to divide one value by another without generating an error. If the numerator or divisor is an illegal value, set 'result' to the phrase 'Not-A-Number'.
proc div-no-error {numerator denumerator} {
    if [catch {expr $numerator / $denumerator}] {
	return Not-A-Number
    }
    return [expr $numerator / $denumerator]
}

# Write a short script that will compare the bodies of all visible procedures and generate a list of procedures with identical bodies.

proc string_code {inputString} {
    set result 0
    for {set i 0} {$i < [string length $inputString]} {incr i} {
	set result [expr $result + [scan [string index $inputString $i] %c]]
    }
    return $result
}

proc string_code2 {inputString} {
    set result 0
    for {set i 0} {$i < [string length $inputString]} {incr i} {
	set result [expr $result + [scan [string index $inputString $i] %c]]
    }
    return $result
}

proc proc_sum {inputProcName} {
    return [string_code [info body $inputProcName]]
}



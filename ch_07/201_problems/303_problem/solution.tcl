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

proc proc_sum2 {inputProcName} {
    return [string_code [info body $inputProcName]]
}

proc proc_sum3 {inputProcName} {
    return [string_code [info body $inputProcName]]
}

proc search_equal_procs_iter {inputProcsName outputResultList} {
    if {[llength $inputProcsName] < 2} {return $outputResultList} {
	set sampleProcName [lindex $inputProcsName 0]
	set reducedProcsNameList [lrange $inputProcsName 1 end]
	set newProcsNameList {}
	set innerResult [list $sampleProcName]
	foreach procName $reducedProcsNameList {
	    if {[info body $sampleProcName] == [info body $procName]} {
		lappend innerResult $procName
	    } {
		lappend newProcsNameList $procName
	    }
	}
	if {[llength $innerResult] > 1} {
	    lappend outputResultList $innerResult
	}
	search_equal_procs_iter $newProcsNameList $outputResultList
    }
}

proc search_equal_procs {} {
    return [search_equal_procs_iter [info procs] {}]
}

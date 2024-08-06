#!/usr/bin/env tclsh
# Make a queue package from the script developed in problem 200. Use the "namespace ensemble" command to allow the methods to be invoked as "queue push", etc. instead of "queue::push".

namespace eval queue {
    variable fifoList {}

    proc push {inputVar} {
	variable fifoList
	lappend fifoList ${inputVar}
    }
    proc pop {} {
	variable fifoList
	set rtn [lindex $fifoList 0]
	set fifoList [lrange ${fifoList} 1 end]
	return $rtn
    }
    proc peek {{inputPosition 0}} {
	variable fifoList
	return [lindex ${fifoList} ${inputPosition}]
    }
    proc size {} {
	variable fifoList
	return [llength ${fifoList}]
    }

    namespace ensemble create -map {
	push "push"
	pop "pop"
	peek "peek"
	size "size"
    }
}

proc addNewCustomer {inputMinTime inputMaxTime} {
    set timeRange [expr $inputMaxTime - $inputMinTime]
    set randomTime [expr int([::tcl::mathfunc::rand] * 8) + 2]
    queue push $randomTime
    # uplevel set k $randomTime
}

proc newCustomerAddRoll {inputProbability} {
    if {[::tcl::mathfunc::rand] < $inputProbability} {
	uplevel addNewCustomer 2 10
    }
}

set currentTime 0

proc proceedTime {} {
    upvar currentTime currentTime
    if {[queue size] > 0} {incr currentTime}
    if {$currentTime == [queue peek]} {
	queue pop
	set currentTime 0
    }
    newCustomerAddRoll 0.1
    puts "Queue size: [queue size]. Queue content: $queue::fifoList"
}

proc simulate {inputCount} {
    upvar currentTime currentTime
    for {set i 0} {$i < $inputCount} {incr i} {
	puts -nonewline "Current step: $i. "
	proceedTime}
}

simulate 1000

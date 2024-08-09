#!/usr/bin/env tclsh
# Expand the check-out counter simulation in exercise 204 to use 3 queues. Assume that a new customer always goes to the shortest queue.

proc makeQueue {inputNamespaceName} {
    uplevel [list namespace eval $inputNamespaceName {
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

	proc printQueue {} {
	    variable fifoList
	    puts "Queue content is $fifoList"
	}

	namespace ensemble create -map {
	    push "push"
	    pop "pop"
	    peek "peek"
	    size "size"
	    printQueue "printQueue"
	}
    }
	    ]
}

proc makeCheckoutCounter {inputCounterName} {
    uplevel [list namespace eval $inputCounterName {
	variable currentTime 0
	makeQueue queueCustomers
	makeQueue queueWaitTime
	proc proceedTime {} {
	    variable currentTime

	}
	namespace ensemble create -map {
	    queueCustomers "queueCustomers"
	    queueWaitTime "queueWaitTime"
	}
    }]
}

# namespace eval queueCustomers {
#     variable fifoList {}

#     proc push {inputVar} {
#	variable fifoList
#	lappend fifoList ${inputVar}
#     }
#     proc pop {} {
#	variable fifoList
#	set rtn [lindex $fifoList 0]
#	set fifoList [lrange ${fifoList} 1 end]
#	return $rtn
#     }
#     proc peek {{inputPosition 0}} {
#	variable fifoList
#	return [lindex ${fifoList} ${inputPosition}]
#     }
#     proc size {} {
#	variable fifoList
#	return [llength ${fifoList}]
#     }

#     namespace ensemble create -map {
#	push "push"
#	pop "pop"
#	peek "peek"
#	size "size"
#     }
# }

namespace eval queueWaitTime {
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

proc + {a b} { expr {$a + $b} }
proc - {a b} { expr {$a - $b} }

proc invoke {func args} { uplevel #0 $func $args }

proc foldl {func init list} {
    foreach item $list { set init [invoke $func $init $item] }
    return $init
}

set currentTime 0

proc addNewCustomer {inputMinTime inputMaxTime} {
    upvar currentTime currentTime
    set timeRange [expr $inputMaxTime - $inputMinTime]
    set randomTime [expr int([::tcl::mathfunc::rand] * 8) + 2]
    queueWaitTime push [- [+ $randomTime [foldl + 0 \
					      $queueCustomers::fifoList]] \
			    $currentTime]
    queueCustomers push $randomTime
}

proc newCustomerAddRoll {inputProbability} {
    if {[::tcl::mathfunc::rand] < $inputProbability} {
	uplevel addNewCustomer 2 10
    }
}

proc proceedTime {} {
    upvar currentTime currentTime
    if {[queueCustomers size] > 0} {incr currentTime}
    if {$currentTime == [queueCustomers peek]} {
	queueCustomers pop
	queueWaitTime pop
	set currentTime 0
    }
    newCustomerAddRoll 0.1
    puts "Customers queue size: [queueCustomers size].\
Customers queue content: $queueCustomers::fifoList.\
Wait queue content: $queueWaitTime::fifoList"
}

proc simulate {inputCount} {
    upvar currentTime currentTime
    for {set i 0} {$i < $inputCount} {incr i} {
	puts -nonewline "Current step: $i. "
	proceedTime}
}

# simulate 1000

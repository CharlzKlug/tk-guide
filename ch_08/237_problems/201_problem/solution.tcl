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

puts "FIFO size is [queue size]"
puts "Adding 1 to FIFO."; queue push 1; puts "FIFO size is [queue size]"
puts "Adding 2 to FIFO."; queue push 2; puts "FIFO size is [queue size]"
puts "Peek 2-nd element: [queue peek 1]"
puts "Pop one element: [queue pop]"
puts "Pop second element: [queue pop]"

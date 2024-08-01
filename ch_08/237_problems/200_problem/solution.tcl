#!/usr/bin/env tclsh
# A FIFO queue can be implemented with a Tcl list. Create a queue namespace in which the Tcl list is a namespace variable. Implemented push, pop, peek, and size procedures within the namespace.

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
}

puts "FIFO size is [queue::size]"
puts "Adding 1 to FIFO."; queue::push 1; puts "FIFO size is [queue::size]"
puts "Adding 2 to FIFO."; queue::push 2; puts "FIFO size is [queue::size]"
puts "Peek 2-nd element: [queue::peek 1]"
puts "Pop one element: [queue::pop]"
puts "Pop second element: [queue::pop]"

#!/usr/bin/env tclsh

# Define the stack class
#  stackVar: Contains the list of items in the stack

::oo::class create stack {
    variable stackVar; # stackVar is a per-object variable.

    # The method to push data onto the top of a stack
    #
    # Arguments
    #  value - A value to push onto the stack
    method push {value} {
	lappend stackVar $value
    }

    # The method to pop data off the top of a stack
    method pop {} {
	set rtn [lindex $stackVar end]
	set stackVar [lrange $stackVar 0 end-1]
	return $rtn
    }

    # The method returns size of the stack
    method size {} {
	return [llength $stackVar]
    }

    # The method return data from the top of a stack,
    # withoud modifying the stack.
    method peek {} {
	return [lindex $stackVar end]
    }
}

# Create a new object named 'st'
# stack create st

# Push values onto the 'st' stack
# st push "value 1"
# st push "value 2"
# puts [st peek]
# puts "The size is [st size]"

# Pop and display
# puts [st pop]

# puts "The size is [st size]"

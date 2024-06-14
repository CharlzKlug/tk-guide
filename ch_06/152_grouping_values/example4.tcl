#!/usr/bin/env tclsh
# Define a dict with 2 elements
set var [dict create \
	     0 [dict create value 1 desc "One"] \
	     1 [dict create value 2 desc "Two"] \
	    ]

# Add a new element 2
dict set var 2 [dict create val 3 desc three]

# Add element 3 using lappend
dict lappend var 3 val 4 desc Four

# Add element 4 using append
dict append var 4 [dict create val 5 desc Five]

# Print the value for element 3
puts "The value for element 3 is [dict get $var 0 desc]"

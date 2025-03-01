#!/usr/bin/env tclsh

# Define a class named limited.
oo::class create limited {
    constructor {} {
	puts "Creating new limited class"
    }
    method show {} {
	puts "This is an object of the limited class"
    }
}

# Define a variable count associated with the class.
# not objects of this class
oo::define limited self variable count

# Define a method to modify the count variable.
oo::define limited self method setCount {{val {}}} {
    if {$val ne ""} {
	set count $val
    }
    return $count
}

# Define a method to create objects of this class.
# This invokes the usual 'new' command to create objects.
oo::define limited self method make {} {
    puts "Count starts at: $count"
    if {$count > 0} {
	incr count -1
	puts "New count: $count"
	return [limited new]
    } else {
	error "Exceeded available object count"
    }
}

# Only allow one limited object to be created
limited setCount 1

# Confirm that and object can be created.
set l1 [limited make]
$l1 show

# Confirm that the second attempt fails
set fail [catch {set l2 [limited make]} rtn]
if {$fail} {
    puts "Create failed: $rtn"
}

# Trying do from class
limited show

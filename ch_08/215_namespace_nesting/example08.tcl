#!/usr/bin/env tclsh
# These commands create a uniqueNumber namespace in the scope of
# the script that invokes it.
namespace eval uniqueNumber {
    variable staticVal 0
    namespace export getNext;
proc getNext {} {
    variable staticVal
    return [incr staticVal]
}
}

# Create the unique1 namespace
# Create a counter namespace within the unique1 namespace
# The Package1 namespace includes a procedure to return unique
# numbers

namespace eval unique1 {
    namespace import ::uniqueNumber::getNext
proc example {} {
    return "unique1::example: [getNext]"
}
}

# Create the unique2 namespace.
# Create a counter namespace within the unique2 namespace
# The unique2 namespace includes a procedure to report unique
# numbers
namespace eval unique2 {
    namespace import ::uniqueNumber::getNext
proc example {} {
    return "unique2::example: [getNext]"
}
}

# Example Script
puts "unique1 example returns: [::unique1::example]"
puts "invoking unique1::getNext directly returns: \
[unique1::getNext]"
puts "unique1 example returns: [::unique1::example]"
puts ""
puts "unique2 example returns: [::unique2::example]"
puts "unique2 example returns: [::unique2::example]"

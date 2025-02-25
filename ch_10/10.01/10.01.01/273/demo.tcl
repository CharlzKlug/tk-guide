#!/usr/bin/env tclsh

# Create an addition class
oo::class create addition {
}

# Add a method to the addition class
oo::define addition method add {a b} {
    return [expr {$a + $b}]
}

addition create addObj

puts "No Filter"
puts "[addObj add 1 2]\n"

# Define a new method to show information about a method call
oo::define addition method show {args} {
    puts "--- [info level 0]"
    next {*}$args
}

# Show method information before all method calls
# to addition objects
oo::define addition filter show
puts "With Filter"
puts "[addObj add 1 2]\n"

# Create a global scope procedure for doubling a pair of numbers
proc double {a b} {
    return [expr {$a + $a + $b + $b}]
}

# Add a forward to a global scope procedure
oo::define addition forward sum2 double

puts "double: [addObj sum2 1 2]\n"

# Add a 'sum' method by re-using the 'add' method.
oo::define addition forward sum my add

puts "Using sum: [addObj sum 1 2]\n"

# Rename the sum2 method to twice
oo::define addition renamemethod sum2 twice

puts "Renamed to twice: [addObj twice 1 2]\n"

# Done with debugging now, delete filter method
oo::define addition deletemethod show

puts "No More Filter"
puts "[addObj add 1 2]\n"

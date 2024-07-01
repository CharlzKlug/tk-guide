#!/usr/bin/env tclsh
# A proc that accepts a variable number of args
proc showArgs {first args} {
    puts "first: $first"
    puts "args: $args"
}

# Example Script
puts "Called showArgs with one arg"
showArgs oneArgument
puts "\nCalled showArgs with two args"
showArgs oneArgument twoArgument
puts "\nCalled showArgs with three args"
showArgs oneArgument twoArgument threeArgument

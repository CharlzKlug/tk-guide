#!/usr/bin/env tclsh

# A proc that expects at least one arg, and has defaults for 2
proc showDefaults {arg1 {numberArg 0} {stringArg {default val}}} {
    puts "arg1: $arg1"
    puts "numberArg: $numberArg"
    puts "stringArg: $stringArg"
}

# Example Script
puts "\nCalled showDefaults with one argument"
showDefaults firstArgument
puts "\nCalled showDefaults with two arguments"
showDefaults firstArgument 3
puts "\nCalled showDefaults with three arguments"
showDefaults firstArgument 3 "testing"

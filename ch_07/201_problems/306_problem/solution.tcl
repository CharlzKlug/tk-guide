#!/usr/bin/env tclsh

# Write two procedures, as follows.
# Syntax: class className body
# Adds a new class name to a collection of known classes and associates the body with that class.
# Syntax: new className value
# Creates a variable with a unique name in the global scope, and assigns value to it. Creates a new procedure with the same name and single argument args, and uses the body that was defined with the class command as the body for the procedure.
# When complete, code such as follows should function.
# class test {return "args are: $args"}
# set x [new test 22]
# puts "Value of test: [set $x]"
# puts "Results of test: [$x a b c]"
# The script output would look as follows.

# Script Output
# Value of test: 22
# Results of test: args are: a b c

proc genUniqueValue {} {
    return [clock microseconds][::tcl::mathfunc::int [expr [::tcl::mathfunc::rand] * 10000]]
}

proc class {className body} {
    uplevel "proc $className {args} {$body}"
}

proc new {className value} {
    set uniqueValue gen[genUniqueValue]
    uplevel [list set $uniqueValue $value]
    uplevel "proc $uniqueValue {args} {$className {*}\$args}"
    return $uniqueValue
}

class test {return "args are: $args"}
set x [new test 22]
puts "Value of test: [set $x]"
puts "Results of test: [$x a b c]"

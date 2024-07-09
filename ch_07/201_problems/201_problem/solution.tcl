#!/usr/bin/env tclsh

# Write a procedure that will accept zero or more numeric arguments and return the sum if there are multiple arguments, or a 0 if there were no arguments.
proc ladd {{arg1 0} args} {
    ::tcl::mathop::+ {*}[list $arg1 {*}$args]
}

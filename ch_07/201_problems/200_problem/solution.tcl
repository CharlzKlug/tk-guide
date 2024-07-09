#!/usr/bin/env tclsh

# Write a procedure that will accept one or more numeric arguments and return their sum.
proc ladd {arg1 args} {
    ::tcl::mathop::+ {*}[list $arg1 {*}$args]
}

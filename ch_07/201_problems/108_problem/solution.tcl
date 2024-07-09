# What Tcl command will define a procedure named foo
#   a. with a single required argument?
proc foo {arg1} {
    return $arg1
}

#   b. with a single optional argument with a default value of 2?
proc foo {{arg1 42}} {
    return $arg1
}

#   c. that accepts zero or more arguments?
proc foo {args} {
    return $args
}

#   d. that accepts two or more arguments?
proc foo {arg1 arg2 args} {
    return [list $arg1 $arg2 {*}$args]
}

#   e. that has one required argument, one optional argument with a default value of 2, and may accept more arguments?
proc foo {arg1 {arg2 2} args} {
    return [list $arg1 $arg2 {*}$args]
}

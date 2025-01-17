#!/usr/bin/env tclsh

proc foo {} {
    puts hello
}

foo

eval \
    "proc bar {} {puts bar}"

bar

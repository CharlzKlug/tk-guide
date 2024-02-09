#!/bin/sh
#\
    exec tclsh "$0" "$@"
set t [exec ls]
puts $t

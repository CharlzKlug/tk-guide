#!/bin/sh
# \
    exec wish "$0" "$@"
scrollbar .sb
.sb set .3 .8
puts "Start and end fractions are: [.sb get]"

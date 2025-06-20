#!/bin/sh
# \
    exec wish "$0" "$@"

# 104. What is the difference between the return value of
# $widget cget -foreground
# and
# $widget configure -foreground
button .b -text "Hello!"
grid .b

set widget .b

puts [$widget cget -foreground]
$widget configure -foreground #ff0000
puts [$widget cget -foreground]

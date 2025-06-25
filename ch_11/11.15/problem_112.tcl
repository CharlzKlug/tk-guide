#!/bin/sh
# \
    exec wish "$0" "$@"

# 112. What command will check for pending events?

# Schedule the task to exit in 10 seconds
set exitEvent [after 10000 exit]
button .b -text "Click me to cancel exit!" \
    -command "after cancel $exitEvent"
pack .b
foreach id [after info] {
    puts "Event id: $id"
    puts "Event description: [after info $id]"
}

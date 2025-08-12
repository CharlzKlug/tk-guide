#!/bin/sh
#\
    exec wish "$0" "$@"
# 204. Write a busy-bar application that will use a label to add characters to
# the text in a 'label' widget to indicate a procedure's progress.

set currentStatus 0

label .captionProgressLabel -text "Progress:"
label .progressStatusLabel -text "..."

grid .captionProgressLabel .progressStatusLabel

proc update-status {} {
    global currentStatus status
    incr status
    .progressStatusLabel configure -text $status
    after 1000 update-status
}

update-status

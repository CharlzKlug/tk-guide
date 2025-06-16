#!/bin/sh
# \
    exec wish "$0" "$@"

# Create the label.
label .l -text "" -width 40
grid .l

# Assign some text.
set str "Tcl makes programming Fun"

# And add new text to the label one character at a time.
for {set i 1} {$i < [string length $str]} {incr i} {
    .l configure -text [string range $str 0 $i]
    update
    after 1000
}

###
# proc shortenText {widget} ---
#  Remove the first character from the displayed string of a
#  widget
# Arguments
#  widget   The name of a widget with a -text option
#
# Results
# Removes the first character from the text string of the
# provided widget if one exists.
#
# Schedules itself to run again if the -text string wasn't
# empty.
proc shortenText {widget} {
    # Get the current text string from the widget.
    set txt [$widget cget -text]

    # If it's empty, we're done.
    if {$txt eq ""} {
        return;
    }

    # shorten the string
    set txt [string range $txt 1 end]

    # Update the widget
    $widget configure -text $txt

    # And schedule this procedure to be run again in 1 second.
    after 1000 shortenText $widget
}
shortenText .l

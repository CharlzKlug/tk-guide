#!/bin/sh
# \
    exec wish "$0" "$@"

# Create the "quit" and "calculate" buttons
set quitbutton [button .quitbutton -text "Quit" -command "exit"]

set gobutton [button .gobutton -text "Calculate Sales Tax" \
		  -command {set salesTax [format %.2f \
					      [expr $userInput * 0.15]]}]

# Create the label prompt, and entry widgets
set input [entry .input -textvariable userInput]
set prompt [label .prompt -text "Base Price:"]

# Create the label and result widgets
set tax [label .tax -text "Tax :"]
set result [label .result -textvariable salesTax -relief raised]

# Set the size of the main window
. configure -width 250 -height 100

# Place the buttons near the bottom
place $quitbutton -relx .75 -rely .7
place $gobutton -relx .01 -rely .7

# Place the input widget near the top.
place $prompt -x 0 -y 0
place $input -x 75 -y 0

# Place the results widgets in the middle
place $tax -x 0 -y 30
place $result -x 40 -y 30

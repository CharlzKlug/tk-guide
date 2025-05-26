#!/bin/sh
# \
    exec wish "$0" "$@"

set quitbutton [button .quitbutton -text "Quit" -command "exit"]
set gobutton [button .gobutton -text "Calculate Sales Tax" \
		  -command {set salesTax [format %.2f \
					      [expr $userInput * 0.15]]}]
set input [entry .input -textvariable userInput]
set prompt [label .prompt -text "Base Price:"]
set tax [label .tax -text "Tax:"]
set result [label .result -textvariable salesTax -relief raised]
grid $quitbutton $gobutton -row 3
grid $prompt $input -row 1
grid $tax $result -row 2 -sticky w

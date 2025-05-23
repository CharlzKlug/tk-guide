#!/bin/sh
# \
    exec wish "$0" "$@"

set withFill 0

# Create the frames for the widgets
set buttonFrame [frame .buttons]
set inputFrame [frame .input]
set resultFrame [frame .results]

# Create the widgets
set quitbutton [button .buttons.quitbutton -text "Quit" \
		    -command "exit"]
set gobutton [button .buttons.gobutton \
		  -text "Calculate Sales Tax" \
		  -command {set salesTax \
				[format %.2f [expr $userInput * 0.15]]}]
set input [entry $inputFrame.input -textvariable userInput]
set prompt [label $inputFrame.prompt -text "Base Price:"]
set tax [label $resultFrame.tax -text "Tax :"]
set result [label .results.result -textvariable salesTax \
		-relief raised]

# Pack the widgets into their frames.
pack .buttons.quitbutton -side right
pack .buttons.gobutton -side right
pack $input -side right
pack $prompt -side left
pack $tax -side left
pack $result -side left

# Pack the frames into the display window.
pack .buttons -side bottom
pack $inputFrame -side top

# The left example image is created by setting
# withFill to 0 outside this code snippet.
# The right example image is created by setting
# withFill to 1 outside this code snippet.
if {$withFill} {
    pack $resultFrame -after $inputFrame -fill x
} else {
    pack $resultFrame -after $inputFrame
}

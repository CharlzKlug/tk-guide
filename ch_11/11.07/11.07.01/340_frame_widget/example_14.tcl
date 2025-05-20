#!/bin/sh
# \
    exec wish "$0" "$@"

set infoFrame [frame .info]
set buttonFrame [frame .buttons]
set mainFrame [frame .main -relief solid -borderwidth 2]
set statusFrame [frame .status]

set w [label $infoFrame.name -text "Sample Application" \
	   -font {arial 16 bold}]
grid $w
set w [label $infoFrame.version -text "Revision 1.0"]
grid $w

foreach buttonName {File Edit Help} {
    lappend buttonList [button $buttonFrame.b_$buttonName \
			    -text $buttonName -command "perform_$buttonName"]
}
grid {*}$buttonList

foreach id {Name Street City State} {
    set w1 [label $mainFrame.l_$id -text $id:]
    set w2 [entry $mainFrame.e_$id -textvariable State($id) \
		-background white]
    grid $w1 $w2
}

set w1 [label $statusFrame.status -textvariable status]
set w2 [label $statusFrame.time -textvariable time]

grid $w1 $w2

set status "No Errors"
set time [clock format [clock seconds]]

grid $infoFrame
grid $buttonFrame -sticky w
grid $mainFrame -sticky ew
grid $statusFrame

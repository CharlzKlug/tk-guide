#!/bin/sh
# \
    exec wish "$0" "$@"

set infoFrame [frame .info]
set mainFrame [frame .main -relief solid]
set statusFrame [frame .status]

set w [label $infoFrame.name -text "Sample Application" \
	   -font {arial 16 bold}]
grid $w
set w [label $infoFrame.version -text "Revision 1.0"]
grid $w

set status "No Errors"
set time [clock format [clock seconds]]

set w1 [label $statusFrame.status -textvariable status]
set w2 [label $statusFrame.time -textvariable time]

grid $w1 $w2

# Create the paned window and grid it in the main frame
set pw [panedwindow $mainFrame.n]
grid $pw

# Nested lists for the 3 tabs and the elements within
# each tab.
foreach \
    txt {Address Biographical Employment} \
    elements {
	{Street City State}
	{Name {Birth} {School}}
	{{Start Date} {End Date}}} {
	    set w [frame $pw.f_[incr unique] -relief solid -borderwidth 1]
	    foreach el $elements {
		set w1 [labelframe $w.lf_[incr unique] -text $el]
		set w2 [entry $w1.e_[incr unique] -textvar State($el)]
		grid $w1
		grid $w2
	    }
	    $pw add $w
	}

grid $infoFrame
grid $mainFrame
grid $statusFrame -sticky w

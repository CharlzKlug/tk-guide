#!/bin/sh
# \
    exec wish "$0" "$@"

set mainFrame [frame .main -relief solid]
grid $mainFrame

# Define a unique number to create an undefined
# number of unique widget names.
set unique 0

# Create the notebook and grid it in the main frame
set note [::ttk::notebook $mainFrame.n]
grid $note

# Nested lists for the 3 tabs and the elements within
# each tab.

foreach txt {Address Biographical Employment} \
    elements {{Street City State}
	{Name {Birth} {School}}
	{{Start Date} {End Date}}} {
	    set w [frame $note.f_[incr unique]]
	    foreach el $elements {
		set w1 [labelframe $w.lf_[incr unique] -text $el]
		set w2 [entry $w1.e_[incr unique] -textvar State($el)]
		grid $w1
		grid $w2
	    }
	    $note add $w -text $txt -sticky n
	}

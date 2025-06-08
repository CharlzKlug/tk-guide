#!/bin/sh
# \
    exec wish "$0" "$@"

# Create the left listbox, defined to allow only a single
# selection
listbox .lSingle -selectmode single -exportselection no
grid .lSingle -row 1 -column 0
.lSingle insert end "top" "middle" "bottom"

# Create the right listbox, defined to allow multiple items
# to be selected.
listbox .lMulti -selectmode multiple -exportselection no
grid .lMulti -row 1 -column 1
.lMulti insert end "MultiTop" "MultiMiddle" "MultiEnd"

# Create a button to report what's been selected
button .report -text "Report" -command "report"
grid .report -row 0 -column 0 -columnspan 2

# And a procedure to loop through the listboxes.
# and display the selected values.
proc report {} {
    foreach widget [list .lSingle .lMulti] {
        set selected [$widget curselection]
        foreach index $selected {
            set str [$widget get $index]
            puts "$widget has index $index selected - $str"
        }
    }
}

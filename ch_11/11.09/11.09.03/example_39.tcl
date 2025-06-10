#!/bin/sh
# \
    exec wish "$0" "$@"

# Create two listboxes
listbox .leftbox -height 5 -exportselection 0
listbox .rightbox -height 5 -exportselection 0

# And fill them. The right box has twice as many entries as
# the left.
for {set i 0} {$i < 10} {incr i} {
    .leftbox insert end "Left Line $i"
    .rightbox insert end "Right Line $i"
    .rightbox insert end "Next Right $i"
}

# Display the listboxes
grid .leftbox -column 0 -row 0
grid .rightbox -column 2 -row 0

# Create the scrollbar, set the initial slider size, and
# display
scrollbar .scroll -command \
    "moveLists .scroll .leftbox .rightbox"

# The right listbox is displaying 5 of 20 lines
.scroll set 0 [expr 5.0 / 20.0]
grid .scroll -column 1 -row 0 -sticky ns

##############################################################
# proc moveLists {scrollbar listbox1 listbox2 args} --
#     Controls two listboxes from a single scrollbar
#     Shifts the top displayed entry and slider such that both
#     listboxes start and end together. The list with the most
#     entries will scroll faster.
#
# Arguments
# scrollbar The name of the scrollbar
# listbox1  The name of one listbox
# listbox2  The name of the other listbox
# args      The arguments appended by the scrollbar widget
#
# Results
#     No valid return.
#     Resets displayed positions of listboxes.
#     Resets size and location of scrollbar slider.

proc moveLists {scrollbar listbox1 listbox2 args} {

    # Get the height for the listboxes - assume
    #     both are the same.

    set height [$listbox2 cget -height]

    # Get the count of entries in each box.
    set size1 [$listbox1 size]
    set size2 [$listbox2 size]
    if {$size1 > $size2} {
        set size ${size1}.0
    } else {
        set size ${size2}.0
    }

    # Get the current scrollbar location
    set scrollPosition [$scrollbar get]
    set startFract [lindex $scrollPosition 0]

    # Calculate the top displayed entry for each listbox
    set top1 [expr int($size1 * $startFract)]
    set top2 [expr int($size2 * $startFract)]

    # Parse the arguments added by the scrollbar widget
    set cmdlst [split $args]

    switch [lindex $cmdlst 0] {
        "scroll" {
            # Parse count and unit from cmdlst
            foreach {sc count unit} $cmdlst {}

            # Determine whether the arrow or the bar was
            # clicked (is the command "scroll 1 unit"
            # or "scroll 1 page")
            if {[string first units $unit] >= 0} {
                set increment [expr 1 * $count];
            } else {
                set increment [expr $height * $count]
            }

            # Set the new fraction for the top of the list
            set topFract1 [expr ($top1 + $increment) / $size]
            set topFract2 [expr ($top1 + $increment) / $size]
            if {$topFract1 < 0} {set topFract1 0}
            if {$topFract2 < 0} {set topFract2 0}
        }
        "moveto" {
            # Get the fraction of the list to display as top
            set topFract [lindex $cmdlst 1]
            if {$topFract < 0} {set topFract 0}

            # Scale the display to the number of entries in
            # the listbox
            set topFract1 [expr $topFract * ($size1 / $size)]
            set topFract2 [expr $topFract * ($size2 / $size)]
        }
    }

    # Move the listboxes to their new location
    $listbox1 yview moveto $topFract1
    $listbox2 yview moveto $topFract2

    # Reposition the scrollbar slider
    set topFract [expr ($topFract1 > $topFract2) \
                      ? $topFract1 : $topFract2]
    if {$topFract > (1.0 - ($height - 1) / $size)} {
        set topFract [expr (1.0 - ($height - 1) / $size)]
    }
    set bottomFract [expr $topFract + (($height - 1) / $size)]
    $scrollbar set $topFract $bottomFract
}

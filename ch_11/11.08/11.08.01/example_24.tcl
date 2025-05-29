#!/bin/sh
# \
    exec wish "$0" "$@"

# Update the displayed text in a label
proc updateLabel {myLabel item} {
    global price
    set total 0
    foreach potion [array names price] {
        incr total $price($potion)
    }
    $myLabel configure -text "Total cost is $total Gold Pieces"
}

# Create and display a label
set l [label .l -text "Select a Potion"]
grid $l -column 0 -row 0 -columnspan 3

# A list of potions and prices
set itemList [list "Cure Light Wounds" 16 \
                  "Boldness" 25 \
                  "See Invisible" 60 \
                  "Love Potion Number 9" 45]

set position 1

foreach {item cost} $itemList {
    checkbutton .b_$position -text $item \
        -variable price($item) -onvalue $cost -offvalue 0 \
        -command "[list updateLabel $l $item]"
    grid .b_$position -row $position -column 0 -sticky w
    incr position
}

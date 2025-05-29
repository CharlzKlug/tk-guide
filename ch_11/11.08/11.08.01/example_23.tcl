#!/bin/sh
#\
    exec wish "$0" "$@"

# Update the displayed text in a label
proc updateLabel {myLabel item} {
    global price
    $myLabel configure -text \
        "The cost for a potion of $item is $price gold pieces"
}

# Create and display a label
set l [label .l -text "Select a Potion"]
grid $l -column 0 -row 0 -columnspan 3

set price 20

# A list of potions and prices
set itemList [list "Cure Light Wounds" 16 \
                  "Boldness" 20 \
                  "See Invisible" 60]
set position 0
foreach {item cost} $itemList {
    radiobutton .b_$position -text $item -variable price \
        -value $cost -command [list updateLabel $l $item]
    grid .b_$position -column $position -row 1
    if {$price == $cost} [list updateLabel $l $item]
    incr position
}

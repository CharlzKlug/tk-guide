#!/usr/bin/env tclsh

# Given this code fragment:
# namespace eval pizza {
# variable toppingList
# variable size medium
# variable style deep-dish
# }

# Add procedures to
# a. Add toppings to a pizza.
# b. Set a pizza size.
# c. Set a pizza style.
# d. Report the size, style, and toppings on a pizza.
# e. Report the price of a pizza. (Define a base price and a price per topping. Ignore style and size.)

namespace eval pizza {
    variable toppingList {}
    variable size medium
    variable style deep-dish
    variable price 0
    variable toppingsPriceList {{ham 10} {mayonnaise 2} {salami 40} {tuna 23} {mozzarella 12}}
    proc addTopping {inputTopping} {
	variable toppingsPriceList
	variable price
	set toppingIndex [lsearch $toppingsPriceList [list $inputTopping *]]
	if {$toppingIndex == -1} {error "There is no such topping: $inputTopping"}
	set toppingPricePair [lindex $toppingsPriceList $toppingIndex]
	set toppingPrice [lindex $toppingPricePair 1]
	set price [expr $price + $toppingPrice]
	variable toppingList
	lappend toppingList $inputTopping
    }

    proc setSize {inputSize} {
	variable size
	set size $inputSize
    }

    proc setStyle {inputStyle} {
	variable style
	set style $inputStyle
    }

    proc description {} {
	variable size
	puts "Size: $size."
	variable style
	puts "Size: $style."
	variable toppingList
	puts -nonewline "Toppings: "
	if {$toppingList == {}} {puts "empty."} {
	    foreach topping [lrange $toppingList 0 end-1] {puts -nonewline "$topping, "}
	    puts "[lindex $toppingList end]."
	}
    }

    proc getPrice {} {
	variable price
	puts "Price: $price."
    }
}

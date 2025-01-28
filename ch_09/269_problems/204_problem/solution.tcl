#!/usr/bin/env tclsh

# 204 A Pizza namespace was created in Chapter 8, exercise 202. Write a TclOO class with the same variables and methods.

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

proc isElem {inputList inputElem} {
    if {[lsearch $inputList $inputElem] >= 0} {
	return true
    }
    return false
}

oo::class create pizza {
    variable toppingList size style price
    constructor {inputSize inputStyle inputTopping} {
	my setSize $inputSize
	my setStyle $inputStyle
	set price 0
	set toppingList {}
	my AddTopping $inputTopping
    }

    method AddTopping {inputTopping} {
	set toppingsPriceList {{ham 10} {mayonnaise 2}
	    {salami 40} {tuna 23} {mozzarella 12}}
	foreach someTopping $inputTopping {
	    set toppingIndex [lsearch $toppingsPriceList [list $someTopping *]]
	    if {$toppingIndex == -1} {error "There is no such topping: $someTopping"}
	    set toppingPricePair [lindex $toppingsPriceList $toppingIndex]
	    set toppingPrice [lindex $toppingPricePair 1]
	    set price [expr $price + $toppingPrice]
	    lappend toppingList $someTopping
	}
    }

    method addTopping {inputTopping} {
	my AddTopping $inputTopping
    }

    method setSize {inputSize} {
	if {[isElem {small middle large} $inputSize]} {
	    set size $inputSize
	} else {
	    error "Wrong size '$inputSize'! Must be\
'small', 'middle' or 'large'."
	}
    }

    method setStyle {inputStyle} {
	set style $inputStyle
    }

    method description {} {
	set outputLine "Size: $size. Style: $style. Toppings:"
	if {$toppingList == {}} {set outputLine "$outputLine empty."} {
	    foreach topping [lrange $toppingList 0 end-1] {
		set outputLine "$outputLine $topping,"
	    }
	    set outputLine "$outputLine [lindex $toppingList end]."
	}
	return $outputLine
    }

    method getPrice {} {
	return "Price: $price."
    }
}

pizza create myPizza small pancacke {ham salami}
puts [myPizza description]
puts [myPizza getPrice]

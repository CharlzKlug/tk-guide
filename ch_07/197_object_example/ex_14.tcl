#!/usr/bin/env tclsh

proc createFruitObject {name colors} {
    global $name
    set $name $colors
    proc $name {color} {
	set name [lindex [info level 0] 0]
	upvar #0 $name fruit
	if {[lsearch $fruit $color] >= 0} {
	    return "Correct, $name can be $color"
	} else {
	    return "No, $name are $fruit"
	}
    }
}

set fruitList {apples {red yellow green}
bananas yellow
grapes {green purple}}

foreach {fruit colors} $fruitList {
createFruitObject $fruit $colors
}

foreach fruit [list apples bananas grapes] {
puts "What color are $fruit?"
gets stdin answer
puts [$fruit $answer]
}

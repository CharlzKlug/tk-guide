#!/usr/bin/env tclsh

proc createFruitObject {fruitName fruitColors} {
    proc $fruitName [list color [list colors $fruitColors]] {
	set name [lindex [info level 0] 0]
	if {[lsearch $colors $color] >= 0} {
	    return "Correct, $name can be $color"
	} else {
	    return "No, $name are $colors"
	}
    }
}

# Create new fruit commands
foreach {name colors} {apples {red yellow green}
bananas yellow
grapes {green purple}} {
createFruitObject $name $colors
}

foreach fruit [list apples bananas grapes] {
puts "What color are $fruit?"
gets stdin answer
puts [$fruit $answer]
}

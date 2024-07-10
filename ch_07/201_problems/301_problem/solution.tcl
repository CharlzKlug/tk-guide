#!/usr/bin/env tclsh
# Write a script that will display all permutations of the values of a list of variable names, as suggested by the following.
# set a 1
# set b 2
# set list {a b}
# showPermutations $list
# ...
# with output
# 1 1
# 1 2
# 2 1
# 2 2

set a 1
set b 2
set list {a b}

proc showPermutations {inputList} {
    proc permutationsIter {inputListAcc} {
	upvar 1 inputList inputList
	if {[llength $inputListAcc] == [expr [llength $inputList] - 1]} {
	    foreach item $inputList {
		puts [linsert $inputListAcc end $item]
	    }
	} {
	    foreach item $inputList {
		permutationsIter [linsert $inputListAcc end $item]
	    }
	}
    }
set inputList [lmap item $inputList {uplevel [list subst $$item]}]
permutationsIter {}
}

# eltclsh > showPermutations $list
# 1 1
# 1 2
# 2 1
# 2 2

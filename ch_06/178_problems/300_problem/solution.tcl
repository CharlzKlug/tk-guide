#!/usr/bin/env tclsh
# The kitchen in an automated restaurant might receive orders as patrons select items from a menu via a format such as the following.
# {{Table 2} {burger} {ketchup mustard}}
# {{Table 3} {drink} {medium}}
# {{Table 2} {fries} {large}}
# {{Table 1} {BLT} {no mayo}}
# {{Table 3} {Complete} {}}
# {{Table 1} {drink} {small}}
# {{Table 1} {Complete} {}}
# Write a script that will accept data in a format such as this, collecting the items ordered at a table and reporting a table's order when the Complete message is received. After reporting an order, it should be ready to start assembling a new order for that table.

set ordersDict [dict create]

proc process {inputQuery} {
    upvar 1 ordersDict ordersDict
    set table [lindex $inputQuery 0]
    set meal [lindex $inputQuery 1]
    set opts [lindex $inputQuery 2]
    if {$meal == {Complete} && $opts == {}} {
	if {[dict exists $ordersDict $table]} {
	    set result [dict get $ordersDict $table]
	    set ordersDict [dict remove $ordersDict $table]
	    return $result
	} {return {}}
    } {
	dict lappend ordersDict $table [list $meal $opts]
	return {}
    }
}

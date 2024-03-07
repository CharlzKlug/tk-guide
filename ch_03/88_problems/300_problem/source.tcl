proc bubble-sort {input_list} {
    return [bubble-sort-recur $input_list 0 false]
}

proc bubble-sort-recur {input_list input_index need_restart} {
    if {$input_list == {}} {return $input_list}
    if {$input_index == [llength $input_list] - 1} {
	if {$need_restart} {
	    tailcall bubble-sort-recur $input_list 0 false
	} {
	    return $input_list
	}
    }

    set element1 [lindex $input_list $input_index]
    set element2 [lindex $input_list [expr {$input_index + 1}]]
    if {$element1 > $element2} {
	lset input_list $input_index $element2
	lset input_list [expr {$input_index + 1}] $element1
	tailcall bubble-sort-recur $input_list [expr {$input_index + 1}] true
    }
    tailcall bubble-sort-recur $input_list [expr {$input_index + 1}] $need_restart
}

proc bubble-sort-loop {input_list} {
    set input_list_length [llength $input_list]
    if {$input_list_length < 2} {return $input_list}

    set sort_one_more_time false

    while true {
	for {set i 0} {$i < [expr {$input_list_length - 1}]} {incr i} {
	    set element1 [lindex $input_list $i]
	    set element2 [lindex $input_list [expr {$i + 1}]]
	    if {$element1 > $element2} {
		lset input_list $i $element2
		lset input_list [expr {$i + 1}] $element1
		set sort_one_more_time true
	    }
	}
	if {!$sort_one_more_time} break
	set sort_one_more_time false
    }
    return $input_list
}

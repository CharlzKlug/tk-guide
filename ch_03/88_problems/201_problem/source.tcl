proc histogram {input_string} {
    set words_list [string tolower $input_string]

    foreach word $words_list {
	set word_list [array get words_quantity $word]
	if {[llength $word_list] == 2} {
	    set quantity [lindex $word_list 1]
	    array set words_quantity [list $word [expr {$quantity + 1}]]
	} {array set words_quantity [list $word 1]}
    }

    foreach name [array names words_quantity] {
	puts [array get words_quantity $name]
    }
}

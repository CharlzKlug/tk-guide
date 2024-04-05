proc supplement-chunk {input_chunk} {
    set chunk_length [string length $input_chunk]
    switch $chunk_length {
	1 {set input_chunk "$input_chunk   "}
	2 {set input_chunk "$input_chunk  "}
	3 {set input_chunk "$input_chunk "}
    }
    return $input_chunk
}

proc make-chunks {input_string} {
    set string_length [string length $input_string]
    set result {}
    for {set i 0} {$i < $string_length} {incr i 4} {
	set chunk [string range $input_string $i [expr {$i + 3}]]
	set chunk [supplement-chunk $chunk]
	lappend result $chunk
    }
    return $result
}

proc encode-chunks {input_chunks_list} {
    set result_list {}
    foreach x $input_chunks_list {
	binary scan $x I x
	lappend result_list $x
    }
    return $result_list
}

proc encode-string {input_string} {
    return [encode-chunks [make-chunks $input_string]]
}

proc decode-integers {input_integers_list} {
    set result_string ""
    foreach int_val $input_integers_list {
	set tmp [binary format I $int_val]
	set result_string $result_string$tmp
    }
    return [string trim $result_string]
}

proc process_string {input_string} {
    set splitted_strings [split $input_string ,]
    foreach current_string $splitted_strings {
	puts [string trim $current_string]
    }
}

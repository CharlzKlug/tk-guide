proc is_palindrom? {input_string} {
    return [expr {$input_string eq [string reverse $input_string]}]
}

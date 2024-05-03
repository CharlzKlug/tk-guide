proc list_older_files {inputSampleFile inputDirectory} {
    set referenceTime [file mtime $inputSampleFile]
    set allFiles [glob -directory $inputDirectory -types {f} -- *]
    set result {}
    foreach fileName $allFiles {
	if {[file mtime $fileName] < $referenceTime} {
	    lappend result $fileName
	}
    }
    return $result
}

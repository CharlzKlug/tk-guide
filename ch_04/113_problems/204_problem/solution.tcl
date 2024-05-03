proc search_oldest_file {inputFileName} {
    set filesList [glob -types {f} -nocomplain -- *]
    set oldestFileName $inputFileName
    if {$oldestFileName ne ""} {
	set oldestDate [file mtime $oldestFileName]
    } else {
	set oldestDate ""
    }
    foreach fileName $filesList {
	if {$oldestDate eq ""} {
	    set oldestFileName $fileName
	    set oldestDate [file mtime $oldestFileName]
	} else {
	    if {[file mtime $fileName] < $oldestDate} {
		set oldestFileName $fileName
		set oldestDate [file mtime $oldestFileName]
	    }
	}
    }
    return $oldestFileName
}

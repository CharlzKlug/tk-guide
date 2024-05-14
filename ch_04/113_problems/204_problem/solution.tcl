proc search_oldest_file {inputFileName inputDirName} {
    set filesList [glob -types {f} -nocomplain -directory $inputDirName -- *]
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

proc search_oldest_file_dir {input_dir_name inputFileName} {
    set dirList [glob -type d -directory $input_dir_name -nocomplain -- *]
    set oldestFileName $inputFileName
    foreach dirName $dirList {
	set oldestFileName [search_oldest_file_dir $dirName $oldestFileName]
    }
    set oldestFileName [search_oldest_file $oldestFileName $input_dir_name]
    return $oldestFileName
}

proc find_oldest_file {inputDirName} {
    return [search_oldest_file_dir $inputDirName ""]
}

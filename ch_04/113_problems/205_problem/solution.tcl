proc is_file_contain {inputFileName inputPattern} {
    if {![file exist $inputFileName]} {
	return 0
    }
    set chan [open $inputFileName]
    while {![eof $chan]} {
	if {[string match -nocase $inputPattern [gets $chan]]} {
	    close $chan
	    return 1
	}
    }
    close $chan
    return 0
}

proc proceed_files {inputDirName inputPattern} {
    set filesList [glob -types {f} -nocomplain -directory $inputDirName -- *]
    foreach fileName $filesList {
	if {[is_file_contain $fileName $inputPattern]} {
	    puts $fileName
	}
    }
}

proc proceed_directories {inputDirName inputPattern} {
    set dirList [glob -type {d} -directory $inputDirName -nocomplain -- *]
    foreach dirName $dirList {
	proceed_directories $dirName $inputPattern
    }
    proceed_files $inputDirName $inputPattern
}

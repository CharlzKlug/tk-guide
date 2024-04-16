proc read_file {fileDescriptor} {
    while {![eof $fileDescriptor]} {
	gets $fileDescriptor lsLine
	puts $lsLine
    }
}

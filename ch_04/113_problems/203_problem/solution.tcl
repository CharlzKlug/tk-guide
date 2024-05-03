proc list_by_size {inputDirectoryName} {
    set allFiles [glob -directory $inputDirectoryName -types {f} -- *]
    set listFilenamesSizes {}
    foreach fileName $allFiles {
	set extendedFileName $fileName
	lappend listFilenamesSizes [list $extendedFileName [file size $fileName]]
    }
    set sortedListFilenamesSizes [lsort -integer -index 1 $listFilenamesSizes]
    set fileNamesList [lmap fileNameSizeList $sortedListFilenamesSizes {lindex $fileNameSizeList 0}]
    return $fileNamesList
}

proc fileDict {parent} {
    set dct {}
    foreach fl [glob -nocomplain $parent/*] {
	if {[file type $fl] eq "directory"} {
	    dict set dct $fl [fileDict $fl]
	} else {
	    dict set dct $fl {}
	}
    }
    return $dct
}

proc showDict {dct indent} {
    # If dict keys fails, this is not a dictionary.
    # Print it and return.
    if {[catch {dict keys $dct}]} {
	puts "[string repeat " " $indent]$dct"
	return
    }

    # Step through the keys in this dictionary and recurse
    foreach k [dict keys $dct] {
	puts "[string repeat " " $indent]$k"
	set v [dict get $dct $k]
	showDict $v [expr {$indent + 2}]
    }
}

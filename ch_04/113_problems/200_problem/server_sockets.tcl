#!/usr/bin/env tclsh

set FILENAMES {
    /home/user/projects/tk-guide/ch_04/113_problems/200_problem/1.tmp
    /home/user/projects/tk-guide/ch_04/113_problems/200_problem/2.tmp
}

proc serverOpen {channel addr port} {
    global FILENAMES
    initializeData $FILENAMES
    after 2000 "examineFiles $channel [list [list {*}$FILENAMES]]"
}

proc initializeData {filenames_list} {
    global fileDataList
    foreach filename $filenames_list {
	file stat $filename fileData
	lappend fileDataList [array get fileData]
    }
}

proc examineFiles {channel filenames} {
    global fileDataList
    set i 0
    foreach filename $filenames {
	file stat $filename newData
	array set fileData [lindex $fileDataList $i]
	set changeDetected FALSE
	foreach index [array names newData] {
	    if {$newData($index) != $fileData($index)} {
		if {$changeDetected eq FALSE} {
		    puts $channel "[clock format [clock seconds]]"
		}
		set changeDetected TRUE
		puts $channel "$filename: $index has changed"
		puts $channel "    was: $fileData($index) now: $newData($index)"
		flush $channel
	    }
	}
	file stat $filename fileData
	set fileDataList [lreplace $fileDataList $i $i [array get fileData]]
	incr i
    }
    after 2000 "examineFiles $channel \{$filenames\}"
}

set serverPort 12345
set server [socket -server serverOpen $serverPort]
set done 0
vwait done

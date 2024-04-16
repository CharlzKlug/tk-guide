#!/usr/bin/env tclsh

set FILENAME /home/user/projects/tk-guide/ch_04/109_server_sockets/1.tmp

proc serverOpen {channel addr port} {
    # Set up fileevent to be called when input is available
    global FILENAME
    initializeData $FILENAME
    after 2000 "examineFiles $channel $FILENAME"
}

proc initializeData {filename} {
    global fileData
    file stat $filename fileData
}

proc examineFiles {channel filename} {
    global fileData
    file stat $filename newData
    foreach index [array names newData] {
	if {$newData($index) != $fileData($index)} {
	    puts $channel "$filename: $index has changed"
	    puts $channel "    was: $fileData($index) now: $newData($index)"
	    flush $channel
	}
    }
    file stat $filename fileData
    after 2000 "examineFiles $channel $filename"
}

set serverPort 12345
set server [socket -server serverOpen $serverPort]
set done 0
vwait done

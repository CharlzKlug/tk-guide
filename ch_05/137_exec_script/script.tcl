#!/usr/bin/env tclsh
# Extracts a URL from a mozilla/firefox bookmark file
# findUrl -
# Finds a line in the text string that matches the
# pattern string. Extracts the URL from that line.

# Arguments:
# match The pattern to try and match
# text The string to search for a match in.

# Results:
# Returns the matched URL, or ""
proc findUrl {match text} {
    set url ""
    set expression [format {"http://(.*?%s.*?)"} $match]
    regexp -line -nocase $expression $text full url
    return $url
}

# Check for a command line arguments

if {$argc != 1} {
    puts "geturl.tcl string"
    exit -1;
}

# Find a Firefox bookmark file.
# The path to this file depends on the platform and operating system.
switch $tcl_platform(platform) {
    unix {
	switch $tcl_platform(os) {
	    Darwin {
		set paths [glob [file join $env(HOME) Library \
				     "Application Support" Firefox Profiles \
				     *default bookmarks.html]]
		set bookmarkName [lindex $paths end]
	    }
	    Linux {
		set paths [glob [file join $env(HOME) .mozilla firefox \
				     *default bookmarks.html]]
		set bookmarkName [lindex $paths 0]
	    }
	    default {
		set paths [glob [file join $env(HOME) .mozilla firefox \
				     *default bookmarks.html]]
		set bookmarkName [lindex $paths 0]
	    }
	}
    }
    windows {
	set paths [glob [file join C:/ "Documents and Settings" $env(USERNAME) \
			     "Application Data" Mozilla Firefox Profiles *.default bookmarks.html]]
	set path [lindex [glob $paths] 0]
	set bookmarkName [string trim $path "{}"]
    }
    mac -
    macintosh {
	set path [file join $env(PREF FOLDER) Netsc* * Bookmarks.html]
	set path [lindex [glob $path] 0]
	set bookmarkName [string trim $path "{}"]
    }
    default {
	puts "I don't recognize platform: $tcl platform(platform)"
	exit -1;
    }
}

# Open the bookmark file, and read in the data

set bookmarkFile [open $bookmarkName]
set bookmarks [read $bookmarkFile]
close $bookmarkFile

puts [findUrl $argv $bookmarks]

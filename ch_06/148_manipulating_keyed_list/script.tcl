#!/usr/bin/env tclsh
# proc keyedListAppend {list key value}
#     Return a list with a new key/value element at the end
# Arguments
#     list: Original list
#     key: Key for new element
#     value: Value for new element
proc keyedListAppend {list key value} {
    lappend list [list $key $value]
    return $list
}

# proc keyedListSearch {list keyName}
#     Retrieve the first element that matches $keyName
# Arguments
#     list: The keyed list
#     keyName: The name of a key
proc keyedListSearch {list keyName} {
    set pos [lsearch $list "*$keyName*"]
    return [lindex [lindex $list $pos] 1]
}

# proc keyedListRetrieve {list keyName}
#     Retrieve all elements that match a key
# Arguments
#     list: The keyed list
#     keyName: The name of key to retrieve
proc keyedListRetrieve {list keyName} {
    set start 0
    set pos [lsearch [lrange $list $start end] "*${keyName}*"]
    set locations {}
    while {$pos >= 0} {
	lappend locations [expr $pos + $start]
	set start [expr $pos + $start + 1]
	set pos [lsearch [lrange $list $start end] "*${keyName}*"]
    }
    set rtn {}
    foreach l $locations {
	lappend rtn [lindex [lindex $list $l] 1]
    }
    return $rtn
}

# Define a simple e-mail header
set header {
    Return-Path: <root@firewall.example.com>
    Received: from firewall.example.com
    Received: from mailserver.example.com
    Received: from workstation.noucorp.com
    Date: Tue, 6 Aug 2002 04:13:38 -0400
    Message-Id: <200208060813.g768DcP30231>
    From: root@firewall.example.com (Cron Daemon)
    To: root@firewall.workstation.com
    Subject: Daily Report
}

# Initialize a keyed list
set keyedList ""

# Parse the e-mail header into the keyed list.
#     The first ":" marks the key and value for each line.
#
# Note that [split $line :] won't work because of lines
# with timestamps.
foreach line [split $header \n] {
    set p [string first : $line]
    if {$p < 0} {continue}
    set key [string range $line 0 [expr {$p - 1}]]
    set value [string range $line [expr {$p + 2}] end]
    set keyedList [keyedListAppend $keyedList $key $value]
}

# Extract some data from the keyed list
puts "Mail is from: [keyedListSearch $keyedList From]"
puts "Mail passed through these systems in this order:"
foreach r [keyedListRetrieve $keyedList Received] {
    puts " [lindex $r 1]"
}

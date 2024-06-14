#!/usr/bin/env tclsh

# Define a simple e-mail header
set header {
    Return-Path: <root@firewall.example.com>
    Received: from firewall.example.com
    Received: from mailserver.example.com
    Received: from workstation.noucorp.com
    Date: Tue, 6 Aug 2002 04:13:38 -0400
    Message-Id: <200208060813.g768DcP30231>
    From: root@firewall.example.com (Cron Daemon)
    To: root@firewall.example.com
    Subject: Daily Report
}

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
    dict lappend keyedList $key $value
}

# Extract some data from the keyed list
puts "Mail is from: [dict get $keyedList {    From}]"
puts "Mail passed through these systems in this order:"
foreach r [dict get $keyedList {    Received}] {
    puts "[lindex $r 1]"
}

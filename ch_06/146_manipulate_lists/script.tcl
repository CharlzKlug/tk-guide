#!/usr/bin/env tclsh

# Define textual data
set text {
    KEY1:Flynt:Clif:clif@cflynt.com
    KEY2:Doe:John:jxd@example.com
    KEY3:Doe:Jane:janed@example.com
}

# Set up a list
foreach line [split $text \n] {
    # Skip any blank lines
    if {$line eq ""} {
	continue
    }
    lappend data [split $line :]
}

# data is a list of lists.
#
# { {KEY1 Flynt Clif clif@cflynt.com}
#   {KEY2 Doe John jxd@example.com} ...}

# Assign the record positions to mnemonically named variables
set keyIndex 0;
set lastNameIndex 1;
set firstNameIndex 2;
set eMailIndex 3;

# Find the record with KEY2
set position [lsearch $data "{*KEY2} *"]

# Extract a copy of that record
set record [lindex $data $position]

# Display fields from that record
puts "The Email address for Record [lindex $record $keyIndex] \
([lindex $record $firstNameIndex]) was \
[lindex $record $eMailIndex] "

# Modify the eMail Address
set newRecord [lreplace $record $eMailIndex $eMailIndex \
		   "joed@example.com"]

# Confirm change
puts "New Email address for Record [lindex $newRecord $keyIndex] \
([lindex $newRecord $firstNameIndex]) is \
[lindex $newRecord $eMailIndex] "

# Update the main list
set data [lreplace $data $position $position $newRecord]

# Convert the list to colon-delimited form, and display it.
foreach record $data {
    puts "[join $record :]"
}

#!/usr/bin/env tclsh
# Open a file for writing - Note square brackets cause the Tcl command
# to be evaluated, and the channel handle returned by open
# is assigned to the variable outputFile.
set outputFile [open "testfile" "w"]

# send a line to the output file.
puts $outputFile "This is line 1"
puts $outputFile "This is line 2"
puts $outputFile "This is line 3"

# Close the file.
close $outputFile
# Reopen the file for reading
set inputFile [open "testfile" "r"]

# Read a line of text
set numBytes [gets $inputFile string]
# Display the line read
puts "Gets returned $numBytes charactes in the string: $string"

# Read the rest of the file
set string2 [read $inputFile]
puts "Read: $string2"

# Announce intent
puts "\nOpening a Pipe\n"

# and open a pipe to the ls command
set pipe [open "|ls /" "r"]

# Equivalent command under MS-Windows is:
# set pipe [open "!command.com /c dir" "r"]

# read the output of the ls command:
while {![eof $pipe]} {
    set length [gets $pipe lsLine]
    if {![eof $pipe]} {
	puts "$lsLine is $length characters long"
    }
}

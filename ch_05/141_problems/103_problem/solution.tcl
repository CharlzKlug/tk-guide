# What regular expression atom will match the following?
# * One occurence of any character
regexp "." "1"

# * One occurence of any character between A and L
regexp "\[A-L\]{1}" "12M 8"

# * One occurence of any character except Q
regexp "\[^Q\]{1}" "A"

# * The word Tcl
regexp Tcl "A Tcl is"

# * A single digit
regexp "\[0-9\]" "1"

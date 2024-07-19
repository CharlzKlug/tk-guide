#!/usr/bin/env tclsh
# Add the current folder to the search path if it
# is not already in the set of directories to be searched.
# if {[lsearch [::tcl::tm::path list] [pwd]] < 0} {
#     ::tcl::tm::path add [pwd]
# }

::tcl::tm::path add [pwd]/lib/tcl8/site-tcl
package require testmod
testmodCmd

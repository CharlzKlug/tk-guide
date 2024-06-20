#!/usr/bin/env tclsh
# Given the following
set datas { \
		{{Name {John Doe}} {UserName johnd} {Password JohnPwd}} \
		{{UserName jdoe} {Name {Jane Doe}} {Password JanePwd}} \
		{{Name {John Smitch}} {Password JohnPwd} {UserName johns}} \
		{{UserName jonnjonzz} {Password manhunter} {Name {John Jones}}} \
	    }
# a. What combination of 'lsearch' and 'lindex' commands would find the password for John Jones?
set indexOuter [lsearch -all $datas {*{Name {John Jones}}*}]
set outerList [lindex $datas $indexOuter]
set innerIndex [lsearch $outerList Password*]
puts [lindex [lindex $outerList $innerIndex] 1]

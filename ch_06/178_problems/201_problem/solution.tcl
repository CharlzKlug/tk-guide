#!/usr/bin/env tclsh
# Given the following
set datas { \
		{{Name {John Doe}} {UserName johnd} {Password JohnPwd}} \
		{{UserName jdoe} {Name {Jane Doe}} {Password JanePwd}} \
		{{Name {John Smitch}} {Password JohnPwd} {UserName johns}} \
		{{UserName jonnjonzz} {Password manhunter} {Name {John Jones}}} \
		{{UserName jacksmith} {Password manhunter} {Name {Jack Smith}}} \
	    }

# a. What combination of 'lsearch' and 'lindex' commands would find the password for John Jones?
set indexOuter [lsearch -all $datas {*{Name {John Jones}}*}]
set outerList [lindex $datas $indexOuter]
set innerIndex [lsearch $outerList Password*]
puts [lindex [lindex $outerList $innerIndex] 1]

# b. Write a short script that will list users with identical passwords.
proc search-dup-passwords {inputPwdList} {
    foreach record $inputPwdList {
	set passFieldIndex [lsearch $record Password*]
	set passField [lindex $record $passFieldIndex]
	set pass [lindex $passField 1]

	set nameFieldIndex [lsearch $record Name*]
	set nameField [lindex $record $nameFieldIndex]
	set name [lindex $nameField 1]

	set usernameFieldIndex [lsearch $record UserName*]
	set usernameField [lindex $record $usernameFieldIndex]
	set username [lindex $usernameField 1]

	dict lappend passes $pass [list $username $name]
    }
    puts "Identical passwords:"
    foreach key [dict keys $passes] {
	if {[llength [dict get $passes $key]] > 1} {
	    puts ""
	    puts "Password: $key"
	    foreach names [dict get $passes $key] {
		puts "    Username: [lindex $names 0], name: [lindex $names 1]"
	    }
	}
    }
}

# c. Will you get the record with John Doe's password using an lsearch pattern of John*?
proc get-john-doe-pass {inputDatas} {
    set johnDoeRecordIndex [lsearch $inputDatas {*{Name {John*}}*}]
    set johnDoeRecord [lindex $inputDatas $johnDoeRecordIndex]
    set johnDoePassIndex [lsearch $johnDoeRecord {Password*}]
    set johnDoePassField [lindex $johnDoeRecord $johnDoePassIndex]
    set johnDoePass [lindex $johnDoePassField 1]
    return $johnDoePass
}

#!/usr/bin/env tclsh
set gems [dict create \
	      Agate [dict create color Brown hardness 7.0] \
	      Amethyst [dict create color Purple hardness 7.0] \
	      Aquamarine [dict create color Blue hardness 7.5] \
	     ]

foreach key [dict keys $gems] {
    puts "$key is colored [dict get $gems $key color] with\
[dict get $gems $key hardness] hardness"
}

dict lappend gems Agate family Quartz
dict lappend gems Amethyst family Quartz
dict lappend gems Aquamarine family Beryl

foreach key [dict keys $gems] {
    set str "$key"
    foreach {character value} [dict get $gems $key] {
	append str " $character is $value"
    }
    puts "$str."
}

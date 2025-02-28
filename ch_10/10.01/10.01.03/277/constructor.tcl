#!/usr/bin/env tclsh

foreach type {warrior mage cleric} \
    hits {8 4 6} {
	oo::class create $type
	oo::define $type variable hitpoints myName
	oo::define $type constructor {name} \
	    "set hitpoints $hits; set myName \$name"
	oo::define $type method display {} {return "$myName has $hitpoints"}
	oo::define $type destructor {puts "$myName go bye-bye"}
    }

set w1 [warrior new Sigfried]
set m1 [mage new Brunhilda]
puts "[$w1 display] hitpoints"
puts "[$m1 display] hitpoints"
$m1 destroy

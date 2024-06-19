#!/usr/bin/env tclsh

set lMin 0

for {set i 0} {$i < 500} {incr i} {
    set x "abcd.$i.efg"
    lappend lst $x
    set min [lindex [time {lsearch $lst $x} 100] 0]
    for {set j 0} {$j < 10} {incr j} {
	set tmp [lindex [time {lsearch $lst $x} 100] 0]
	if {$tmp < $min} {set min $tmp}
    }
    puts "$i $min"
    set lMin $min
}

set aMin 0

for {set i 0} {$i < 500} {incr i} {
    set x "abcd.$i.efg"
    set arr($i) $x
    set min [lindex [time {set y $arr($i)} 100] 0]
    for {set j 0} {$j < 10} {incr j} {
	set tmp [lindex [time {set y $arr($i)} 100] 0]
	if {$tmp < $min} {set min $tmp}
    }
    puts "$i $min"
    set aMin $min
}

set dMin 0

for {set i 0} {$i < 500} {incr i} {
    set x "abcd.$i.efg"
    dict set dct $i $x
    set min [lindex [time {dict get $dct $i} 100] 0]
    for {set j 0} {$j < 10} {incr j} {
	set tmp [lindex [time {dict get $dct $i} 100] 0]
	if {$tmp < $min} {set min $tmp}
    }
    puts "$i $min"
    set dMin $min
}

puts "List performance: $lMin"
puts "Array performance: $aMin"
puts "Dict performance: $dMin"

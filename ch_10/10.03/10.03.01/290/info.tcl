#!/usr/bin/env tclsh

oo::class create bottom {
    method show {} {
	puts "hehe, haha"
    }
}

puts "CLASS CALL"
foreach link [info class call bottom show] {
    puts $link
}

bottom create test
puts "\nOBJECT CALL"
foreach link [info object call test show] {
    puts $link
}

# Define a new method in class 'top'
oo::define bottom method testfilter {args} {
    puts "top filter"
    next
}

oo::define bottom filter testfilter
test show

puts "CLASS CALL"
foreach link [info class call bottom show] {
    puts $link
}

puts "\nOBJECT CALL"
foreach link [info object call test show] {
    puts $link
}

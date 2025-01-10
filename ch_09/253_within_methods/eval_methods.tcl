#!/usr/bin/env tclsh
oo::class create methodDemo {
    variable a b c
    constructor {} {
	set a 1
	set b 2
	set c 3
    }
    method puts {var} {
	puts "THE VALUE of $var IS: [set $var]"
    }
    method bad_showContents {} {
	puts a
	puts b
	puts c
    }
    method good_showContents {} {
	my puts a
	my puts b
	my puts c
    }
}
methodDemo create demo
puts " BAD:"
demo bad_showContents
puts " GOOD:"
demo good_showContents

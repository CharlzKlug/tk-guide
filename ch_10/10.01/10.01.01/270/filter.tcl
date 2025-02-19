#!/usr/bin/env tclsh
oo::class create addition {
    method add {inputA inputB} {
	return [expr {$inputA + $inputB}]
    }
}

addition create myadd
oo::define addition method show {args} {
    puts "--- [info level 0]"
    next {*}$args
}

oo::define addition filter show
puts [myadd add 4 5]

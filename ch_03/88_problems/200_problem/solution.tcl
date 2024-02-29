# The classic recursive function is a Fibonacci series, in which each element is the sum of the two preceding elements, as in the following.
# 1 1 2 3 5 8 13 21 ...
# Write a Tcl proc that will accept a single integer, and will generate that many elements of a Fibonacci series.
proc fib {n} {
    set prev 0
    set curr 1
    puts -nonewline "$curr "
    set n [expr {$n - 1}]
    
    for {set i 0} {$i < $n} {incr i} {
	set t [expr {$prev + $curr}]
	set prev $curr
	set curr $t
	puts -nonewline "$curr "
    }
    puts ""
}

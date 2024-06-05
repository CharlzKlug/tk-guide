# Calculating the Y coordinate for a set of experimantally derived X values
foreach xVal {0 1 3 7 10 12} {puts "[expr $xVal * 2]"}

# Calculating the Y coordinate for X values between 1 and 100
for {set x 0} {$x < 101} {incr x} {puts "[expr $x * 2]"}

# Examining all files in a directory
foreach fileName [glob -types f -- *] {puts $fileName}

# Scanning a specific port on a subnetwork to find systems running software with security holes
set hostsString [exec nmap -v -p 22 --open 10.1.6.0/24 | grep "Nmap scan report for" | grep -o -E "\[\[:digit:\]\]+\\.\[\[:digit:\]\]+\\.\[\[:digit:\]\]+\\.\[\[:digit:\]\]+"]
foreach item $hostsString {puts $item}

# Waiting for a condition to change
while {$i < 5} {puts $i; incr i}

# Inverting a numerically indexed array
array set balloon [list 0 a 1 b 2 c]
set arrSize [array size balloon]
set stepThreshold [expr $arrSize / 2]
for {set i 0} {$i < $stepThreshold} {incr i} {
    set tmp $balloon($i)
    set balloon($i) $balloon([expr $arrSize - 1 - $i])
    set balloon([expr $arrSize - 1 - $i]) $tmp
}

# Iterating through a tree
set sampleTree {a {b {c} {d}} {e {f} {g}}}
for {} {[llength $sampleTree] > 2} {set sampleTree [lindex $sampleTree 1]} {puts [lindex $sampleTree 0]}

# Reversing the order of letters in a string
set outputStr ""
for {set i 0} {$i < [string length $sampleString]} {incr i} {
    set outputStr $outputStr[string index $sampleString end-$i]
}

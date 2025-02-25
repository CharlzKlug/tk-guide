#!/usr/bin/env tclsh

oo::class create hasPrivateMethod {
    method PrivateMethod {args} {
	puts "PrivateMethod $args"
    }
}

oo::class create usesPrivateMethod {
    superclass hasPrivateMethod

    method usePrivateMethod {args} {
	my PrivateMethod "From usesPrivateMethod $args"
    }
}

hasPrivateMethod create private1
usesPrivateMethod create use1

puts "\n--- default state"
use1 usePrivateMethod "from global scope"
catch {private1 PrivateMethod "from global"} rtn
puts "Attempt to access PrivateMethod returns:\n $rtn"

puts "\n--- after export"
oo::define hasPrivateMethod export PrivateMethod
private1 PrivateMethod "from global after export"

puts "\n--- after unexport"
oo::define hasPrivateMethod unexport PrivateMethod
catch {private1 PrivateMethod "from global after unexport"} rtn
puts "Attempt to access PrivateMethod returns:\n $rtn"
use1 usePrivateMethod "from global scope"

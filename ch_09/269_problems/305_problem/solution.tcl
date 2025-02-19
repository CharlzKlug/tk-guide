#!/usr/bin/env tclsh

# 305 Add a method to accept the damage inflicted by a weapon.
# This should be added to the character class

source warrior.tcl

weapon create sword Excalibur 10 15
humanwarrior create elmer Sigfried

elmer changeWeapon sword
puts "Attack: [elmer attack]"

puts "Before attack"
elmer show
elmer damaged sword

puts "After attack"
elmer show
elmer destroy

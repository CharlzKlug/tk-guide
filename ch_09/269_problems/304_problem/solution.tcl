#!/usr/bin/env tclsh

# 304 Add a method to calculate the damage
# inflicted by a weapon. This should be added to a weapon class.

source warrior.tcl

weapon create sword Excalibur 10 15
humanwarrior create elmer Sigfried

elmer changeWeapon sword
puts "Attack: [elmer attack]"

elmer destroy

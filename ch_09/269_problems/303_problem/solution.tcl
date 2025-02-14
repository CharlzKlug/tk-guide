#!/usr/bin/env tclsh

# 303 Add an "attack" method to the "humanwarrior" class
# described in this chapter. There will need to be attack
# methods in the base character class and the weapon class.
# The final value returned should be calculated from the
# character's base attack value, the character's weapon
# and a random value.

source warrior.tcl

weapon create sword Excalibur 10
humanwarrior create elmer Sigfried

elmer changeWeapon sword
puts "Attack: [elmer attack]"

elmer destroy

#!/usr/bin/env tclsh

# 108 What command will add a method to a single object?

oo::class create Foo {}

Foo create fooObj1
oo::objdefine fooObj1 method met1 {} {puts Hello!}
if {[catch {fooObj1 met1}]} {
    puts "Error! fooObj1 has not met1 method!"
}
Foo create fooObj2
if {[catch {fooObj2 met1}]} {
    puts "Error! fooObj2 has not met1 method!"
}

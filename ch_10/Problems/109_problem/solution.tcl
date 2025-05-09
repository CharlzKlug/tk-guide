#!/usr/bin/env tclsh

proc checkObjectsMethods {} {
    if {[catch {fooObj1 newMethod Boris}]} {
	puts "There is no newMethod for fooObj1"
    }
    if {[catch {fooObj2 newMethod Bob}]} {
	puts "There is no newMethod for fooObj2"
    }
}

oo::class create Foo {}

Foo create fooObj1
Foo create fooObj2

checkObjectsMethods

oo::define Foo method newMethod {inputName} {
    puts "Say hello to my little $inputName"
}

checkObjectsMethods

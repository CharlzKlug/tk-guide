#!/usr/bin/env tclsh

oo::class create mc {
    constructor {} {
	puts "This is constructor"
    }
}

mc create my_object

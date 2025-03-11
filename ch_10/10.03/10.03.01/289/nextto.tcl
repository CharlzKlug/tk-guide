#!/usr/bin/env tclsh
oo::class create mixer1 {
    constructor {} {
	puts "Mixer1 Constructor"
	catch {nextto foo}
    }
}

oo::class create middle {
    constructor {} {
	puts "Middle class"
	catch {next}
    }
}

oo::class create foo {
    mixin mixer1 middle
    constructor {} {
	puts "Foo creation"
    }
}

foo create bar

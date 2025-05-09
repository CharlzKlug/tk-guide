#!/usr/bin/env tclsh

oo::class create mixer1 {

    constructor {} {
	puts "Mixer1 Constructor"
	catch {next}
    }

    method show {} {
	puts "Mixer1 Show"
	catch {next}
    }
}

oo::class create mixer2 {
    constructor {} {
	puts "Mixer2 Constructor"
	catch {next}
    }
    method show {} {
	puts "Mixer2 Show"
	catch {next}
    }
}

oo::class create top {
    mixin mixer2
    constructor {} {
	puts "Top Constructor"
	catch {next}
    }
    method show {} {
	puts "Top Show"
	catch {next}
    }
}

oo::class create middle {
    superclass top
    constructor {} {
	puts "Middle Constructor"
	catch {next}
    }
    method show {} {
	puts "Middle Show"
	catch {next}
    }
}

oo::class create bottom {
    superclass middle
    mixin mixer1
    constructor {} {
	puts "Bottom Constructor"
	catch {next}
    }
    method show {} {
	puts "Bottom Show"
	catch {next}
    }
}

puts "Order of constructors"
bottom create test

puts "\nOrder of methods being invoked"
test show

puts "\nOrder of methods after oo::objdefine method"
oo::objdefine test method show {} {
    puts "Defined Show";
    catch {next}
}
test show

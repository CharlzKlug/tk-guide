#!/usr/bin/env tclsh

oo::class create base {
    method show {args} {
	puts "base show args: $args"
	catch {next "base::show args: $args"}
    }
}

oo::class create addSuper {
    method show {args} {
	puts "addSuper show -- $args"
	catch {next "addSuper::show args: $args"}
    }
}

oo::class create addMixin {
    method show {args} {
	puts "addMixin show -- $args"
	catch {next "addMixin::show args: $args"}
    }
}

base create base1
puts "\nbase class"
base1 show "no super"

puts "\nbase class with addSuper"
oo::define base superclass addSuper
base1 show "with addSuper"

puts "\nbase class with addSuper and addMixin"
oo::define base mixin addMixin
base1 show "with super and mixin"

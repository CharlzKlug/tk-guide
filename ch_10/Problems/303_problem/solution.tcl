#!/bin/sh
# \
    exec tclsh "$0" "$@"

oo::class create author {
    variable name
    constructor {inputName} {
	set name $inputName
    }
    method getName {} {
	return $name
    }
}

oo::class create book {
    variable title author
    constructor {inputTitle inputAuthor} {
	set title $inputTitle
	set author $inputAuthor
    }
    method getAuthor {} {
	return $author
    }
}

author create mtwain "Mark Twain"
book create tSawyer "The Adventures of Tom Sawyer" mtwain
puts "[mtwain getName]"
puts "[[tSawyer getAuthor] getName]"

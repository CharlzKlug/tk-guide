#!/usr/bin/env tclsh

# Define a card class for playing cards. The class should have a parameter for suit (clubs, spades, etc.), name (Ace, King, Queen, etc.) and value (Ace might be 14, King would be 13, Queen would be 12, etc.).

oo::class create Card {

    variable x
    constructor {inputSuit} {
	set allowedSuits {Club Diamond Heart Spade}
	puts $allowedSuits
	if {}
    }
}

Card create myCard Spade

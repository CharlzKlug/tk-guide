#!/usr/bin/env tclsh

# Define a card class for playing cards. The class should have a parameter for suit (clubs, spades, etc.), name (Ace, King, Queen, etc.) and value (Ace might be 14, King would be 13, Queen would be 12, etc.).

oo::class create Card {
    variable suit rank
    constructor {inputSuit inputRank} {
	set allowedSuits {Club Diamond Heart Spade}
	if {[lsearch $allowedSuits $inputSuit] >= 0} {
	    set suit $inputSuit
	} else {
	    error "Wrong suit: '$inputSuit'! Must be one of 'Club', 'Diamond', 'Heart' or 'Spade'"
	}
	set allowedRanks {2 3 4 5 6 7 8 9 10 Jack Queen King Ace}
	set rankIndex [lsearch $allowedRanks $inputRank]
	if {$rankIndex >= 0} {
	    set rank [expr $rankIndex + 2]
	} else {
	    error "Wrong rank!"
	}
    }

    method getSuit {} {
	return $suit
    }

    method getRank {} {
	return $rank
    }
}

Card create myCard1 Spade Jack
puts [myCard1 getSuit]
puts [myCard1 getRank]
Card create myCard2 Club Queen
Card create myCard3 Club King
Card create myCard4 Club Ace

#!/usr/bin/env tclsh

# Add a method to the card class from exercise 202 to compare the current to the value of a card object passed as an argument. Using this method to compare a King and Ace might look like this:
# set card1 [card create Ace Spades]
# set card2 [card create King Diamonds]
# $card1 compare $card2
# Larger
# $card2 compare $card1
# Smaller

oo::class create card {
    variable suit rank
    constructor {inputRank inputSuit} {
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

    method compare {inputCard} {
	set myRank [my getRank]
	set otherRank [$inputCard getRank]
	if {$myRank > $otherRank} {
	    return Larger
	}
	if {$myRank < $otherRank} {
	    return Smaller
	}
	return Equal
    }
}

card create myCard1 Jack Spade
puts [myCard1 getSuit]
puts [myCard1 getRank]
card create myCard2 Queen Club
card create myCard3 King Club
card create myCard4 Ace Club
set card1 [card new Ace Spade]
set card2 [card new King Diamond]
puts [$card1 compare $card2]
puts [$card2 compare $card1]
puts [$card2 compare $card2]

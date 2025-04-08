#!/usr/bin/env tclsh

oo::class create bug {
    variable days;
    constructor {} {
	# Variable days will not exist unless initialized.
	set days 4
	oo::objdefine [self] mixin larvae
    }

    method day {} {
	[self] draw
	if {[incr days -1] <= 0} {
	    [self] nextPhase
	}
    }
}

oo::class create butterfly {
    method draw {} {
	# This method can access variable 'days' in parent class.
	variable days;
	puts "I am a butterfly - $days days left in this state"
    }

    method nextPhase {} {
	puts "My season in the sun is over"
    }
}

oo::class create pupae {
    # All methods can access variable 'days' in parent class.
    variable days;
    method draw {} {
	puts "I am a pupae - $days days left in this state"
    }

    method nextPhase {} {
	set days 3
	oo::objdefine [self] mixin butterfly
    }
}

oo::class create larvae {
    # All methods can access variable 'days' in parent class.
    variable days;
    method draw {} {
	puts "I am a larvae - $days days left in this state."
    }

    method nextPhase {} {
	set days 2
	oo::objdefine [self] mixin pupae
    }
}

bug create myBug

for {set i 0} {$i < 9} {incr i} {
    myBug day
}

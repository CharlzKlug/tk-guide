#!/usr/bin/env tclsh

proc opened {} {return "Opened"}
proc closed {} {return "Closed"}
proc staying {} {return "Staying"}
proc moving {} {return "Moving"}

oo::class create elevator {
    variable currentFloor requestedFloor movingState doorState;
    constructor {} {
	set currentFloor 1
	set requestedFloor 1
	set doorState [opened]
	set movingState [staying]
	trace add variable requestedFloor {write} [list [self] check]
    }
    method showState {} {
	puts "Current floor is $currentFloor."
	puts "Requested floor is $requestedFloor."
	puts "Door state is \"$doorState\"."
	puts "The elevator is \"$movingState\"."
	puts -------------------------------------
    }
    method moveToFloor {} {
	puts "Move to Floor:"
	if {$currentFloor == $requestedFloor} {
	    set movingState [staying]
	    puts "Arrived to $requestedFloor floor."
	    my openDoor
	} {
	    my closeDoor
	    if {$doorState == [closed]} {
		puts "Moving:"
		set movingState [moving]
		my showState
		set currentFloor $requestedFloor
		my showState
		set movingState [staying]
		my showState
		my openDoor
	    }

	}
    }
    method openDoor {} {
	puts "Opening the door:"
	if {$movingState == [staying]} {
	    set doorState [opened]
	}
	my showState
    }
    method requestFloor {inputFloor} {
	puts "Request Floor $inputFloor"
	set requestedFloor $inputFloor
	my showState
    }
    method closeDoor {} {
	puts "Close the door"
	set doorState [closed]
	my showState
    }
    method check {name1 name2 op} {
	if {[set $name1] < 1} {set $name1 1}
	if {[set $name1] > 5} {set $name1 5}
    }
}

elevator create elevObj
elevObj showState
elevObj requestFloor 0
elevObj moveToFloor
elevObj requestFloor 10
elevObj showState

#!/usr/bin/env tclsh
set player1(position) 0
set player2(position) 0

proc move {playerName} {
    upvar #0 $playerName player
    # Move the piece a random number of spaces
    #   between 0 and 9.
    set move [expr int(rand() * 10)]
    incr player(position) $move
}

while {($player1(position) < 20) & ($player2(position) < 20)} {
    move player1
    move player2
    puts "\nCurrent Positions:"
    puts "  1: $player1(position)"
    puts "  2: $player2(position)"
}

if {$player1(position) > $player2(position)} {
    puts "Player 1 wins!"
} else {
    puts "Player 2 wins!"
}

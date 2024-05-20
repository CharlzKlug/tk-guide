#!/usr/bin/env tclsh

proc say {inputChannel inputMessage} {
    puts $inputChannel $inputMessage
    flush $inputChannel
}

proc serverOpen {channel addr port} {
    puts "New connection: address: $addr, port: $port"
    dialog $channel
    close $channel
}

proc dialog {inputChannel} {
    say $inputChannel "123"
    say $inputChannel "A fox"
    say $inputChannel "What is your name?"
    gets $inputChannel userName
    say $inputChannel "What is your quest?"
    gets $inputChannel userQuest
    say $inputChannel "What is your favorite color?"
    gets $inputChannel userColor
    puts $inputChannel "Your name is $userName."
    puts $inputChannel "You like $userColor clothes."
    puts $inputChannel "You wish $userQuest."
}

set serverPort 12345
set server [socket -server serverOpen $serverPort]
set done 0
vwait done

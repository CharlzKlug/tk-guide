#!/usr/bin/env tclsh

proc sum-list {args} {
    set result 0
    foreach element $args {
	incr result $element
    }
    return $result
}

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
    set inputLine [gets $inputChannel]
    say $inputChannel [sum-list {*}$inputLine]
}

set serverPort 12345
set server [socket -server serverOpen $serverPort]
set done 0
vwait done

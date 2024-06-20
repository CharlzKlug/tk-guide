#!/usr/bin/env tclsh
# Given a set of data in which each line follows the form 'Name:UserName:Password', write a 'foreach' command that will split a line into the variables 'name', 'user', and 'passwd'.
set userDatas {"Ashok Nadkarni:anadkarni:1934783"
    "Bill Gates:bgates:cdkjs388kd9^!"
    "Linus Torvalds:ltorvalds:qwerty"}

foreach str $userDatas {
    set splittedStr [split $str :]
    set name [lindex $splittedStr 0]
    set user [lindex $splittedStr 1]
    set passwd [lindex $splittedStr 2]
    puts "Name: $name"
    puts "User name: $user"
    puts "Password: '$passwd'"
}

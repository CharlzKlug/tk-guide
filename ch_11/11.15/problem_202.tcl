#!/bin/sh
#\
    exec wish "$0" "$@"

# 202. Write a data entry GUI that will use separate entry widgets
# to read First Name, Last Name, and Login ID. When the user clicks
# the Accept button, the data will be merged into proper location in
# a listbox. Insert new entries alphabetically by last name. Attach
# a scrollbar to the listbox.

::oo::class create Person {
    variable firstName
    variable lastName
    variable loginID
    constructor {inputFirstName inputLastName inputLoginID} {
        set firstName $inputFirstName
        set lastName $inputLastName
        set loginID $inputLoginID
    }
    method getFirstName {} {return $firstName}
    method getLastName {} {return $lastName}
    method getLoginID {} {return $loginID}
    method eq {inputPerson} {
        return [string equal $lastName [$inputPerson getLastName]]
    }
    method gt {inputPerson} {
        if {[string compare $lastName [$inputPerson getLastName]] == 1} {return 1} {return 0}
    }
    method lt {inputPerson} {
        if {[string compare $lastName [$inputPerson getLastName]] == -1} {return 1} {return 0}
    }
}

label .firstNameLabel -text "First Name:"
entry .firstNameEntry

label .lastNameLabel -text "Last Name:"
entry .lastNameEntry

label .loginIDLabel -text "Login ID:"
entry .loginIDEntry

button .acceptButton -text "Accept"

grid .firstNameLabel .firstNameEntry
grid .lastNameLabel .lastNameEntry
grid .loginIDLabel .loginIDEntry
grid .acceptButton -columnspan 2 -sticky ew

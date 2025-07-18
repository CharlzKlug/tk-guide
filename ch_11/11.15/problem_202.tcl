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

set personsList {}

proc compare {inputPersonA inputPersonB} {
    return [string compare [$inputPersonA getLastName] \
                   [$inputPersonB getLastName]]
}

label .firstNameLabel -text "First Name:"
entry .firstNameEntry -background #FFFFFF

label .lastNameLabel -text "Last Name:"
entry .lastNameEntry -background #FFFFFF

label .loginIDLabel -text "Login ID:"
entry .loginIDEntry -background #FFFFFF

button .acceptButton -text "Accept" \
       -command "proceedInput .firstNameEntry .lastNameEntry \
.loginIDEntry personsList"

listbox .namesListBox -background #FFFFFF

grid .firstNameLabel .firstNameEntry
grid .lastNameLabel .lastNameEntry
grid .loginIDLabel .loginIDEntry
grid .acceptButton -columnspan 2 -sticky ew
grid .namesListBox -row 0 -column 2 -rowspan 4

proc addPersonToList {inputPerson} {
    global personsList
    lappend personsList $inputPerson
}

proc createPerson {inputFirstName inputLastName inputLoginID} {
    if {[string equal $inputFirstName ""]} {error "First Name is empty!"}
    if {[string equal $inputLastName ""]} {error "Last Name is empty!"}
    if {[string equal $inputLoginID ""]} {error "Login ID is empty!"}
    return [Person new $inputFirstName $inputLastName $inputLoginID]
}

proc proceedInput {inputFirstNameEntry inputLastNameEntry inputLoginIDEntry \
                                       inputPersonsList} {
    addPersonToList [createPerson [$inputFirstNameEntry get] \
                                  [$inputLastNameEntry get] \
                                  [$inputLoginIDEntry get]]
    upvar #0 $inputPersonsList listPersons
    set listPersons [lsort -command compare $listPersons]
    set personsStringList [personsList2stringList $listPersons]

    createListboxContent .namesListBox $personsStringList
}

proc createListboxContent {inputListbox inputContent} {
    $inputListbox delete 0 end
    foreach item $inputContent {
        $inputListbox insert end $item
    }
}

proc person2String {inputPerson} {
    return "[$inputPerson getFirstName] [$inputPerson getLastName] \
[$inputPerson getLoginID]"
}

proc personsList2stringList {inputPersonsList} {
    set result {}
    foreach person $inputPersonsList {
        lappend result [person2String $person]
    }
    return $result
}

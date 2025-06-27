#!/bin/sh
# \
    exec wish "$0" "$@"

proc pigLatin {inputWord} {
    set headLetter [string index $inputWord 0]
    set latinWord [string replace $inputWord 0 0]
    if {[string match -nocase {[aeiouy]} $headLetter]} {
        set latinWord ${latinWord}t
    }
    set latinWord ${latinWord}${headLetter}
    set latinWord ${latinWord}ay
    return $latinWord
}

proc sendTextToLabel {inputLabel inputEntry} {
    global $inputLabel
    global $inputEntry
    set result ""
    set inputString [$inputEntry get]
    set someWord ""
    for {set i 0} {$i < [string length $inputString]} {incr i} {
        set currentChar [string index $inputString $i]
        if {![string is alnum $currentChar] && $someWord != ""} {
            set result ${result}[pigLatin $someWord]
            set someWord ""
        }
        if {![string is alnum $currentChar]} {
            set result ${result}${currentChar}
        } {set someWord ${someWord}${currentChar}}
    }
    if {[string length $someWord] > 0} {set result ${result}[pigLatin $someWord]}
    $inputLabel configure -text [$inputEntry get]
    $inputLabel configure -text $result
}

entry .entry
label .lbl -text "No text"
button .btn -text "To label" -command "sendTextToLabel .lbl .entry"
grid .entry
grid .lbl
grid .btn

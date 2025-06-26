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
    # global .lbl
    # global .entry
    # puts [.entry get]
    global $inputLabel
    global $inputEntry
    puts [$inputEntry get]

    $inputLabel configure -text [$inputEntry get]
}
entry .entry
label .lbl -text "No text"
button .btn -text "To label" -command "sendTextToLabel .lbl .entry"
grid .entry
grid .lbl
grid .btn

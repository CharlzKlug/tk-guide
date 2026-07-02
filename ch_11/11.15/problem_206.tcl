#! /bin/sh
#\
    exec wish "$0" "$@"

# 205. Write a GUI with two sliders and a label. The label will display the
# result of dividing the value in the first slider by the value in the second
# slider.

set nominatorscale [scale .fht -orient horizontal \
                          -from 0 -to 100 -length 250 \
                          -resolution .1 -tickinterval 20 -label "Делимое" \
                          -variable nominator -command nominatorChanged]
proc nominatorChanged {nominator} {
    global denominator
    calculate $nominator $denominator
}
grid $nominatorscale

set denominatorscale [scale .cel -orient horizontal \
                            -from -20 -to 40 -length 250 \
                            -resolution .1 -tickinterval 20 -label "Делитель" \
                            -variable denominator -command denominatorChanged]
proc denominatorChanged {denominator} {
    global nominator
    calculate $nominator $denominator
}
grid $denominatorscale

set resultlabel [label .lbl -text ""]
grid $resultlabel

proc calculate {nominator denominator} {
    global resultlabel
    set result [expr {$denominator != 0 ? [expr $nominator / $denominator] : \
                                   "Error"}]
    $resultlabel configure -text $result
}

calculate $nominator $denominator

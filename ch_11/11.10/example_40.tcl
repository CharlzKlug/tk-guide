#!/bin/sh
# \
    exec wish "$0" "$@"

# Convert the Celsius temperature to Fahrenheit
proc celsiusTofahren {ctemp} {
    global fahrenheit
    set fahrenheit [expr ($ctemp * 1.8) + 32]
}

# Convert the Fahrenheit temperature to Celsius
proc fahrenToCelsius {ftemp} {
    global celsius
    set celsius [expr ($ftemp - 32) / 1.8]
}

# Create a scale for fahrenheit temperatures
set fahrenscale [scale .fht -orient horizontal \
                     -from 0 -to 100 -length 250 \
                     -resolution .1 -tickinterval 20 -label "Fahrenheit" \
                     -variable fahrenheit -command fahrenToCelsius]

# Create a scale for celsius temperature
set celscale [scale .cel -orient horizontal \
                  -from -20 -to 40 -length 250 \
                  -resolution .1 -tickinterval 20 -label "Celsius" \
                  -variable celsius -command celsiusTofahren]

# Grid the widgets.
grid $fahrenscale
grid $celscale

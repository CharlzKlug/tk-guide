#!/bin/sh
# \
    exec wish "$0" "$@"

# 107. Can you use place to display a widget in a frame in which you are also using the pack command?
frame .frame
button .frame.but -text "123"
pack .frame.but
grid .frame

button .frame.butAdd -text "asd"
place .frame.butAdd -rely .35 -relx .35

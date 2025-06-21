#!/bin/sh
# \
    exec wish "$0" "$@"

# 105. How many lines of text can be displayed in a label widget?
label .labelSample -text "123
456
789"
grid .labelSample

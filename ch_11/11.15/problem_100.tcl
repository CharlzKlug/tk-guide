#!/bin/sh
# \
    exec wish "$0" "$@"

# 100. Which of the following are valid window names?
# What is the error in the invalid names?
# a. .b
label .b -text "123"
grid .b

# b. .Button --- not allowed
# label .Button -text ".Button"

# c. .button
label .button -text ".button"
grid .button

# d. .b2
label .b2 -text ".b2"
grid .b2

# e. .2b
label .2b -text ".2b"
grid .2b

# f. .buttonFrame.b1
frame .buttonFrame
label .buttonFrame.b1 -text ".buttonFrame.b1"
grid .buttonFrame
grid .buttonFrame.b1

# g. .top.buttons.b1-quit
frame .top
frame .top.buttons
label .top.buttons.b1-quit -text ".top.buttons.b1-quit"
grid .top.buttons.b1-quit
grid .top.buttons
grid .top

# h. ..button --- not allowed
# label ..button2 -text "..button"
# grid ..button2

# i. .b.1-quit
label .b.1-quit -text ".b.1-quit"
grid .b.1-quit

# Some addition

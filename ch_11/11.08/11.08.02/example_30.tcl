#!/bin/sh
# \
    exec wish "$0" "$@"

. configure -menu .mbar
# Create the top menubar
menu .mbar

# Add a Files pulldown menu to the menubar
# This appears at the left on all operating systems.
.mbar add cascade -label Files -menu .mbar.files
menu .mbar.files
.mbar.files add command -label Open -command "openFile"

# Help shows up at the right on X11 based systems.
.mbar add cascade -label Help -menu .mbar.help
menu .mbar.help
.mbar.help add command -label About -command "displayAbout"

# Normal menu items appear in the order they are defined.
.mbar add cascade -label Settings -menu .mbar.set
menu .mbar.set
.mbar.set add command -label Fonts -command "setFont"

# The .system menu appears on the icon under Windows systems
.mbar add cascade -label System -menu .mbar.system
menu .mbar.system
.mbar.system add command -label "Windows System"

# The .apple menu appears under the application menu
.mbar add cascade -label Apple -menu .mbar.apple
menu .mbar.apple
.mbar.apple add command -label "Apple Menu"
.mbar add command -label Run -command "go"

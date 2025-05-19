#!/bin/sh
# \
    exec wish "$0" "$@"

set input [entry .el -textvariable inputval]
set action [button .b1 -text "Convert to UPPERCASE" \
		-command {set inputval [string toupper $inputval]}]
grid $input
grid $action

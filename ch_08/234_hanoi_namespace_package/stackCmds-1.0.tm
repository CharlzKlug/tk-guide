package provide stackCmds 1.0

namespace eval stackCmds {

    # Define a set of commands that will be used to create an
    # ensemble version of the stack.
    variable stackDef {
	# stack variable is maintained in each stack
	variable stack {}

	# Commands are taken from stackCmd namespace
	namespace ensemble create -map [list \
					    peek "::stackCmds::peek [namespace current]::stack" \
					    size "::stackCmds::size [namespace current]::stack" \
					    push "::stackCmds::push [namespace current]::stack" \
					    pop "::stackCmds::pop [namespace current]::stack"]
    }

    # Make the createStack procedure an ensemble command

    namespace ensemble create -map {
	createStack "::stackCmds::createStack"
    }

    proc createStack {stackName} {
	variable stackDef
	uplevel 1 [list namespace eval $stackName $stackDef]
    }

    proc push {name val} {
	upvar $name stack
	lappend stack $val
    }

    proc peek {name {pos end}} {
	upvar $name stack
	return [lindex $stack $pos]
    }

    proc size {name} {
	upvar $name stack
	return [llength $stack]
    }

    proc pop {name} {
	upvar $name stack
	set rtn [lindex $stack end]
	set stack [lrange $stack 0 end-1]
	return $rtn
    }
}

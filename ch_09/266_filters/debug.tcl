oo::class create debug {
    method showCall {args} {
	puts "--- Debugging: [info level 0]"
	next {*}$args
    }
}

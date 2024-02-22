proc errorProc {first second} {
    global errorInfo
    set fail [catch {expr 5 * $first} result]
    if {$fail} {
	error "Bad first argument"
    }
    set fail [catch {expr $first/$second} dummy]
    if {$fail} {
	error "Bad second argument" \
	    "second argument fails math test \n$errorInfo"
    }
    error "errorProc always fails" "evaluating error" \
	[list USER {123} {Non-Standard User-Defined Error}]
}

puts "call errorProc with a bad first argument"
set fail [catch {errorProc X 0} returnString]
if {$fail} {
    puts "Failed in errorProc"
    puts "Return string: $returnString"
    puts "Error Info: $errorInfo\n"
}
puts "call errorProc with a 0 second argument"
if {[catch {errorProc 1 0} returnString]} {
    puts "Failed in errorProc"
    puts "Return string: $returnString"
    puts "Error Info: $errorInfo\n"
}
puts "call errorProc with valid arguments"
set fail [catch {errorProc 1 1} returnString]
if {$fail} {
    if {[string first USER $errorCode] == 0} {
	puts "errorProc failed as expected"
	puts "returnString is: $returnString"
	puts "errorInfo: $errorInfo"
    } else {
	puts "errorProc failed for an unknown reason"
    }
}

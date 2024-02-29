# Write a procedure that uses info commands to report all the procedures and arguments that exist in an interpreter.
foreach some_proc [info procs] {
    puts "Procedure: $some_proc, arguments: [info args $some_proc]"
}

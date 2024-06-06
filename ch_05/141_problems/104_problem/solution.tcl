# Given the following Tcl command:
# regexp $exp $s full first
# with the variable s assigned the string "An image is worth 5 x 10^3 pixels," what string would be assigned to the variable first for the following values of exp?

set s "An image is worth 5 x 10^3 pixels,"

# * {([0-9]+)}
set exp {([0-9]+)}
regexp $exp $s full first
> puts $full
5
> puts $first
5

# * {([0-9]{2})}
set exp {([0-9]{2})}
regexp $exp $s full first
> puts $full
10
> puts $first
10

# * {A[^ ]*(i[^ ]*)}
set exp {A[^ ]*(i[^ ]*)}
> regexp $exp $s full first
0

# * {(w.*?[[:>:]])}
set s {(w.*?[[:>:]])}
> regexp $exp $s full first
0

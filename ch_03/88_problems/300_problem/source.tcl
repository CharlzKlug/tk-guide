proc bubble-sort {input_list} {
    set my_list $input_list
    bubble-sort {my_list 0 0}
    return $my_list
}

proc bubble-sort-recur {input_list input_index need-restart?} {
    

let tt a b = a;;

let ff a b = b;;

let rec print_bool x = print_string (x "true" "false");;
                                                 
let rec or1 n1 n2 = n1 tt n2;;

print_bool (or1 tt ff);;
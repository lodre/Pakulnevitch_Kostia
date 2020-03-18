let tt a b = a;;

let ff a b = b;;

let rec print_bool x = print_string (x "true" "false");;
                                                 
let rec xor1 n1 n2 = n1 (n2 ff tt) (n2 tt ff);;

print_bool (xor1 tt tt);;
let tt a b = a;;

let ff a b = b;;

let rec print_bool x = print_string (x "true" "false");;

let n f x = f (f x);;

print_bool (if n ((+) 1) 0 = 0 then tt else ff);;
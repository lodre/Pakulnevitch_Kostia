let rec f k n = if n>0 then (f (k/2) (n-1))@[k mod 2 = 1]
                       else [];;
let k = 7;;
let n = 6;;
let l = f k n;;

let rec print_list l = match l with a::b->(print_string (if a then "true;" else "false;");print_list b)
                                   |[]->();;
print_string "[";;
print_list l;;
print_string "]";;
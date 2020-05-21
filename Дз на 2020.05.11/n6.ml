let rec f k n = if n>0 then (f (k/2) (n-1))@[k mod 2 = 1]
                       else [];;
let f2 k n = f k (int_of_float (2.**(float n)));; 
let k = 2;;
let n = 4;;
let l = f2 k n;;


let rec print_list l = match l with a::b->(print_string (if a then "true;" else "false;");print_list b)
                                   |[]->();;
print_string "[";;
print_list l;;
print_string "]";;
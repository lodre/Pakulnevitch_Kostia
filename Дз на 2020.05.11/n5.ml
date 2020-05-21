let rec f k n = if n>0 then (f (k/2) (n-1))@[k mod 2 = 1]
                       else [];;           
let rec print_list l = match l with a::b->(print_string (if a then "true;" else "false;");print_list b)
                                   |[]->();; 

let n = 2;;
for i=0 to int_of_float (2.**(2.**(float n))) - 1 do
    print_string "[";
    print_list (f i (int_of_float (2.**(float n))));
    print_string "]\n";
done;;
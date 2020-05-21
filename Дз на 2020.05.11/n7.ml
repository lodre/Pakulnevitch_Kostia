let rec f k n = if n>0 then (f (k/2) (n-1))@[k mod 2 = 1]
                       else [];;
let f2 k n = f k (int_of_float (2.**(float n)));; 
let k = 2;;
let n = 4;;
let l = f2 k n;;

let rec b i n = if n>0 then (b (i/2) (n-1))^(if i mod 2 = 0 then "F" else "T")^(",")
                       else "";;

let rec print_list l i n = match l with a::t->(print_string "f(";print_string (b i n);print_string ") = ";print_string (if a then "T\n" else "F\n");print_list t (i+1) n)
                                       |[]->();;  
print_list l 0 n;;
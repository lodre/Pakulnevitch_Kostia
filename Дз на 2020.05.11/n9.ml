let rec f k n = if n>0 then (f (k/2) (n-1))@[k mod 2 = 1]
                       else [];;
let f2 k n = f k (int_of_float (2.**(float n)));; 
let k = 2;;
let n = 4;;
let l = f2 k n;;

let rec e l i = match l with a::b->if i = 0 then a else e b (i-1)
                            |[]->true;;

let rec f1 n = if n>0 then (print_string (f1 (n-1);"\\"^(String.make 1 (char_of_int ((int_of_char 'a')+n)))^"."))
                      else print_string ("\\"^(String.make 1 'a')^".");;

let rec f2 l i k = if k<n then "("^(String.make 1 (char_of_int ((int_of_char 'a')+k)))^" "^(f2 l (2*i+1) (k+1))^" "^(f2 l (2*i) (k+1))^")"
                          else (if e l i then "T" else "F");; 

f1 (n-1);;
print_string (f2 l 0 0);;
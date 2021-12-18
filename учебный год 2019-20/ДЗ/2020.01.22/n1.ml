let n = 4;;

let rec check up mid dn placed = match placed with row::p->(if up > n - 2 then true else up+1<>row)&&(mid<>row)&&(if dn < 1 then true else dn-1<>row)&&(check (up+1) mid (dn-1) p)
                                                  |[]->true;;
exception Found of int list;;
let rec find_solution col placed = if col = n then (raise (Found placed));
for row = 0 to n-1 do
    if check row row row placed then find_solution (col + 1) (row::placed)
done;;
let rec print1 l i = match l with a::b-> ((if a = i then print_string "| Ô "
                                                    else print_string "|   "); print1 b i)
                                 |[]->();;
let rec print l =  
for i=0 to n-1 do
(print1 l i; print_string "|\n"; print_string (String.make ((4 * n) + 1) '-');print_string "\n")
done;; 

try (let x = find_solution 0 [] in print_string "false") with Found l -> print l;;

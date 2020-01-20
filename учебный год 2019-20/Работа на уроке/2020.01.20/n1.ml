let n = 4;;

let rec check up mid dn placed = match placed with row::p->(if up > n - 2 then true else up+1<>row)&&(mid<>row)&&(if dn < 1 then true else dn-1<>row)&&(check (up+1) mid (dn-1) p)
                                                  |[]->true;;
let rec map f n = if n>0 then (f n) + (map f (n-1))
                         else f 0;;
let rec find_solution col placed = (if col = n then 1 
                                               else map (fun x -> if check x x x placed then find_solution (col+1) (x::placed) else 0) (n-1));;

let x = find_solution 0 [];;
print_int x;;

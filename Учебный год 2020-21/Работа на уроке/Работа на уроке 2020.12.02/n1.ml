let n = read_int ();;
let rec read l n = if n>0 then (let x = read_int () in match x with 0 -> l::(read [] (n-1))
                                                                   |_ -> read ((x-1)::l) n)
                          else [];;
let l = read [] n;;                           
let rec del1 l i = match l with a::b -> if i=0 then b
                                               else a::(del1 b (i-1))
                               |[] -> [];;
let rec del2 l i = match l with a::b -> if a=i then del2 b i
                                               else (if a<i then a::(del2 b i)
                                                            else (a-1)::(del2 b i))
                               |[] -> [];;
let rec del3 l i = match l with a::b -> (del2 a i)::(del3 b i)
                               |[] -> [];;

let del l i = del3 (del1 l i) i;;

let rec mem l i = match l with a::b -> if a=i then true
                                              else mem b i
                              |[] -> false;;

let rec find_free l1 l2 i = if i=List.length l then failwith ""
                                               else (match l1 with a::b -> if mem a i then find_free l2 l2 (i+1)
                                                                                      else find_free b l2 i 
                                                                  |[] -> i);; 

let rec print l = if l = [] then () 
                            else (let i = find_free l l 0 in
                                  let b = del l i in (print_int (i+1);print_string " "; print b));;

print l;; 
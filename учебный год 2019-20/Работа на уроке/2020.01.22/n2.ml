let n = 4;;    
let rec map f n l = if n>0 then ((f n) l)@(map f (n-1) l)
                           else [];;
let rec count_partition n l = if n > 0 then map (fun x -> fun l -> count_partition (n-x) (x::l)) n l
                                       else [l];;
let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();; 

let rec print2 l =
let rec print1 l = match l with a::b->(print_string "; ";print a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print a;print1 b)
            |[]->();; 

let l = count_partition n [];;
print2 l;;
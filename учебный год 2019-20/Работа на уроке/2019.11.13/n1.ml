let rec f2 x i = if i>0 then (f2 (x/2) (i-1)) @ [(x mod 2)]
                        else [];;

let rec serialize l x y = (f2 y x) @ l ;;

let l = [];;
let x = 5;;
let y = 7;;
let l = serialize l x y;;
let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();;
print l;;
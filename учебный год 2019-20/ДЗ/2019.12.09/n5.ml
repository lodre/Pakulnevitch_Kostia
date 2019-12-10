let x = 54;;
let n = 2;;
let rec convert x n = if x > 0 then (x mod n) :: (convert (x/n) n)
                               else [];;
let l = convert x n;;
let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();; 
print l;;
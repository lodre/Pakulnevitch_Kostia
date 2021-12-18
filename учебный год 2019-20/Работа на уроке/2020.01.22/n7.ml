let n = 7;;                           
let rec check x = 
let rec check1 x y = if x<y then (if (y mod x = 0) then false
                                                   else check1 (x+1) y)
                            else true in
check1 2 x;;
let rec next x = if check (x+1) then x+1
                                else next (x+1);;
let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();; 

let rec map f n x l = if n>0 then ((f (n, next x) l) + (map f (n-x) x (x::l)))
                             else if n = 0 then (print l;1)
                                           else 0;;


let rec count_partition n x l = if x<=n then if n > 0 then map (fun (y,z) -> count_partition y z) n x l
                                                      else if n = 0 then (print l;1)
                                                                    else 0
                                        else 0;;     
                                               
                                                      

let x = count_partition n 1 [];;
print_string "\n";;
print_int x;;                      
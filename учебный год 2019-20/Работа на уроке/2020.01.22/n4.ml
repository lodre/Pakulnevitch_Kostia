let n = 7;;    
let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();; 

let rec map f n x l = if n>0 then ((f (n,x+1) l); (map f (n-x) x (x::l)))
                             else if n = 0 then print l
                                           else ();;


let rec count_partition n x l = if x<=n then if n > 0 then map (fun (y,z) -> count_partition y z) n x l
                                                      else if n = 0 then print l
                                                                    else ()
                                        else ();;     
                                               
                                                      

count_partition n 1 [];;                      
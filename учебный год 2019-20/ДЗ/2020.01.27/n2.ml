let n = 7;;       
let rec sum l = match l with a::b->1+(sum b)
                            |[]->0;;
let rec check l = (sum l) mod 2 = 0;;
let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();; 

let rec map f n x l = if n>0 then ((f (n,x+1) l) + (map f (n-x) x (x::l)))
                             else if n = 0 then if check l then (print l;1)
                                                           else 0
                                           else 0;;


let rec count_partition n x l = if x<=n then if n > 0 then map (fun (y,z) -> count_partition y z) n x l
                                                      else if n = 0 then if check l then (print l;1)
                                                                                    else 0
                                                                    else 0
                                        else 0;;     
                                               
                                                      

let x = count_partition n 1 [];;
print_string "\n";;
print_int x;;                      
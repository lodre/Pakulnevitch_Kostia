let n = 4;;           
let m = 4;;           
let rec comp1 x l2 = match l2 with a::b->(max a x)::(comp1 x b)
                                  |[]->[];;
let rec comp l1 l2 = match l1 with a::b-> (comp1 a l2)@(comp b l2)
                                  |[]->[];;
let rec map f n = if n>=0 then (f n)@(map f (n-1)) else [];;
let rec step n c = if n>0 then map (fun x ->comp (step x (c+1)) (step (n-x-1) (c+1))) (n-1)
                          else [c];;
let l = step n 0;;

let rec f l = match l with a::b-> (if a=m then 1 else 0) + (f b)
                          |[]->0;;

print_int (f l);;
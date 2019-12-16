let x = 73;;
let rec f x l i = if x=0 then if i = 1 then i::l
                                       else l
                         else match x mod 3 with |0-> f (x/3) (i::l) 0
                                                 |1-> if i = 0 then f (x/3) (1::l) 0
                                                               else f (x/3) ((-1)::l) 1
                                                 |2-> f (x/3) ((-1 + i)::l) 1
                                                 |_->[];;
let l = f x [] 0;;


let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();; 

print l;;
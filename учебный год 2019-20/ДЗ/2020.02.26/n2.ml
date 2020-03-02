let l1 = [1;2;3;4;5;6;7;8;10;11];;
let l2 = [1;2;3;4;6;7;8;9;10;11];;

let rec merge l1 l2 = match l1,l2 with (a1,b1)::c1,(a2,b2)::c2-> if b1 < b2 then (a2,b2)::(merge l1 c2) else (a1,b1)::(merge c1 l2)
                                      |_->(l1@l2);;

let rec rise l =
let rec rise2 l x = match l with a::b-> if a>x then (rise2 b a) else false  
                                |[]-> true in 
match l with a::b -> rise2 b a
            |[]-> true;;

let rec filter l x = match l with a::b->if a>x then a::(filter b x) else filter b x
                                 |[]-> [];;
                                                                                            
let rec f l1 l2 = match l1 with a::b-> merge (f b l2) (f (filter b a) (l2@[a]))
                               |[]  -> if rise l2 then [(l2,(List.length l2))] else [([],0)];;
                       
let l1 = f l1 [];;     
let l2 = f l2 [];;     

let rec find l1 l2 = 
let rec find1 (a,b) l = match l with (a1,b1)::l1 -> if b1=b then if a1=a then Some a
                                                                         else find1 (a,b) l1 
                                                            else None
                                    |[]-> None in 
match l1,l2 with (a1,b1)::c1,(a2,b2)::c2 -> if b1>b2 then find c1 l2
                                       else if b2>b1 then find l1 c2
                                       else (match (find1 (a1,b1) l2) with None   ->find c1 l2
                                                                          |Some l ->l)
                
|_->[];;

let l = find l1 l2;;
let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();;        
print l;;
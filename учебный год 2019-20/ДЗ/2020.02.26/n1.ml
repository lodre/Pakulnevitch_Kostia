let l = [40 ;76 ;25 ;55 ;20 ;41 ;10 ;7 ;40 ;38 ;57 ;61 ;25 ;75 ;45 ;57 ;53 ;19 ;64 ;14 ;13 ;10 ;13 ;31 ;85 ;88 ;22 ;3 ;37 ;41 ;1 ;39 ;1 ;1 ;69 ;7 ;19 ;49;42;78;3;21;88;55;66;45;40;61;61;37];;

let rec rise l =
let rec rise2 l x = match l with a::b-> if a>x then (rise2 b a) else false  
                                |[]-> true in 
match l with a::b -> rise2 b a
            |[]-> true;;

let rec filter l x = match l with a::b->if a>x then a::(filter b x) else filter b x
                                 |[]-> [];;

let maxi (a1,b1) (a2,b2) = if b1 > b2 then (a1,b1) else (a2,b2);;

let rec f l1 l2 = match l1 with a::b-> maxi (f b l2) (f (filter b a) (l2@[a]))
                               |[]  -> if rise l2 then (l2,(List.length l2)) else ([],0);;

let l2 = f l [];;

let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();;        
print (fst l2);;

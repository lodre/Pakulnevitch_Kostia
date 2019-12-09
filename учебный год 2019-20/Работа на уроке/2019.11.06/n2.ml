type tree = |Node of tree*tree
            |Leaf of float;;

let l = [0.1;0.2;0.3;0.4];;
let rec f l = match l with a::b->(Leaf a,a)::(f b)
                          |[]->[];;
let l = f l;;

let rec g l x = match l with []->[]
                            |a::b->if a=x then g b x
                                          else a::(g b x);; 
let sort l =                                                          
let min l = 
let rec mini l (x,y) = match l with (c,a)::b->if a<y then mini b (c,a)
                                                     else mini b (x,y)
                           |[]->(x,y) in
   match l with a::b->mini b a
               |[]->(Leaf 0.,0.) in
let rec sort l1 l2 = match l1 with [] -> l2
                                  |a::b->let m = min l1 in sort (g l1 m) (l2 @ (m::[])) in
sort l [];;
                              
let step l = 
   let stepp l = match l with (a,b)::(c,d)::e->(Node (a,c),b+.d)::e
                             |_->l in
stepp (sort l);;

let rec main l = let l = step l in 
match l with (a,b)::[]->a
            |_-> main l;;
let t = main l;;

let rec print_tree t = match t with Node (t1,t2)-> (print_string "Node (";print_tree t1 ;print_string ", " ;print_tree t2 ;print_string ")")
                                   |Leaf x ->(print_string "Leaf ";print_float x);;
print_tree t;;
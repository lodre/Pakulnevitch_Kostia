type tree = |Node of tree*tree
            |Leaf of char;;



let s = "ajknefclabef;jabdanekjefbajnaelfn alnefanfeoaelfajn fen eanf ank e kf";;
let f s = 
   let ch s c =
      let rec cha s c i = if i<String.length s then (if s.[i]=c then 1 
                                                                else 0)+(cha s c (i+1)) 
                                               else 0 in
                                    (Leaf c, cha s c 0) in
   let rec find l x = match l with a::b-> if x=a then true 
                                                 else find b x
                                  |[]->false in
   let rec list_count s i = if i<String.length s then (if s.[i] = ' ' then list_count s (i+1)
                                                                      else (ch s s.[i])::(list_count s (i+1)))
                                                 else [] in
   let rec del l = match l with a::b->if find b a then del b 
                                                  else a::(del b)
                               |[]->[] in
   let rec slc s = del (list_count s 0) in (* sort list of count *)
      slc s;;

let l = f s;;       



let rec g l x = match l with []->[]
                            |a::b->if a=x then g b x
                                          else a::(g b x);; 
let sort l =                                                          
let min l = 
let rec mini l (x,y) = match l with (c,a)::b->if a<y then mini b (c,a)
                                                     else mini b (x,y)
                           |[]->(x,y) in
   match l with a::b->mini b a
               |[]->(Leaf ' ',0) in
let rec sort l1 l2 = match l1 with [] -> l2
                                  |a::b->let m = min l1 in sort (g l1 m) (l2 @ (m::[])) in
sort l [];;
                              
let step l = 
   let stepp l = match l with (a,b)::(c,d)::e->(Node (a,c),b+d)::e
                             |_->l in
stepp (sort l);;
let l2 = step l;;
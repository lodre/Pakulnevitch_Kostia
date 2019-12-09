let s = "ajknefclabef;jabdanekjefbajnaelfn alnefanfeoaelfajn fen eanf ank e kf";;
let f s = 
let ch s c = let rec cha s c i = if i<String.length s then (if s.[i]=c then 1 
                                                                       else 0)+(cha s c (i+1)) 
                                                      else 0 in
                                 ((cha s c 0), c) in
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
let rec print l =match l with (a,b)::c->print_string "(";print_int a;print_string ",";print_char b;print_string ");";print c
                             |[]->();;
print_string "[";;
print l;;
print_string "]";;
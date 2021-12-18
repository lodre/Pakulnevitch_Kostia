
(* let rec c s1 s2 i = if String.length s1 <= i  then (s1,s2)
                                              else if String.length s2 <= i then (s2,s1)
                                                                            else (if s1.[i]=s2.[i] then (c s1 s2 (i+1))
                                                                                                   else (if int_of_char(s1.[i])>int_of_char(s2.[i]) then (s2,s1)
                                                                                                                                                    else (s1,s2)));;

let rec insert l x = match l with (a,b)::c -> if x = a then (a,b+1)::c
                                                       else (a,b)::(insert c x)
                                 |[] -> (x,1)::[];; 

let f = open_in "n3.txt";;                      

let rec read l s = try
                      let x = input_char f in if x<'A' then if s = "" then read l ""
                                                                      else read (insert l s) ""
                                                       else read l (s^(String.make 1 x))  
                   with _ -> l;;

let l = read [] "";;

let rec word s = 

let rec f l = match l with a::b -> a @ (f b)
                          |[] -> [];;

let l = f l;;
                                     
let rec lis1 l a = match l with [] -> []
                               |x::b->if x = snd (c x a 0) then x::(lis1 b a) else (lis1 b a);;
let rec lis2 l a = match l with [] -> []
                               |x::b->if (x = fst (c x a 0) && not (x = a)) then x::(lis2 b a) else (lis2 b a);;
let rec sort l = match l with [] -> []
                             |a::b->(sort (lis1 b a))@[a]@(sort (lis2 b a));;                  



let rec s l1 l2 (x,y) = match l1 with [] -> (x,y)::l2
                                     |a::b -> if x = a then s b l2 (x,y+1)
                                                       else s b ((x,y)::l2) (a,1);;


                                           
let rec print_list l i = if i = 0 then ()
                                  else match l with (a,b)::c -> (print_string ("("^a^","^(string_of_int b)^")\n"); print_list c (i-1))
                                                   |[] -> ();;
                                                                                               
let rec lis1 l1 l2 (a,b) = match l1 with [] -> l2
                                        |(x,y)::c -> if y>=b then lis1 c ((x,y)::l2) (a,b) 
                                                             else lis1 c l2 (a,b);;            
let rec lis2 l1 l2 (a,b) = match l1 with [] -> l2
                                        |(x,y)::c -> if y<b then lis2 c ((x,y)::l2) (a,b) 
                                                             else lis2 c l2 (a,b);;
let rec sort l = match l with [] -> []
                             |a::b->(sort (lis1 b [] a))@[a]@(sort (lis2 b [] a));;
                                   
let l = sort l;;

print_list l 10;;


let (x,y) = match l with a::b->a
                        |_->("",0);;

print_string (x^" — "^(string_of_int y));;
*)

let f = open_in "n3.txt";;

let rec c s1 s2 i = if String.length s1 <= i  then (s1,s2)
                                              else if String.length s2 <= i then (s2,s1)
                                                                            else (if s1.[i]=s2.[i] then (c s1 s2 (i+1))
                                                                                                   else (if int_of_char(s1.[i])>int_of_char(s2.[i]) then (s2,s1)
                                                                                                                                                    else (s1,s2)));;

let rec insert l x = match l with (a,b)::c -> if x = a then (a,b+1)::c
                                                       else (a,b)::(insert c x)
                                 |[] -> (x,1)::[];; 


let rec words s i = if i < String.length s then (if (s.[i]<'A') then ""
                                                                else (String.make 1 (s.[i]))^(words s (i+1)))
                                           else "";;
let rec next1 s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1)
                                                                else i)
                                           else i;;
let rec next s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1)
                                                               else next s (i+1))
                                          else i;;
let rec words_list s i = if i < String.length s then (words s i)::(words_list s (next s i))
                                                else [];;         
let rec map l f x = match l with a::b-> map b f (f x a)
                                |[]->x;;

let rec m l1 l2 = match l1 with a::b -> m b (insert l2 a)
                               |_->l2;;

let rec read1 l = try
                      let y = input_line f in let x = words_list y 0 in
                      read1 (m x l)
                  with end_of_file->l;;
let l = read1 [];;


let rec s l1 l2 (x,y) = match l1 with [] -> (x,y)::l2
                                     |a::b -> if x = a then s b l2 (x,y+1)
                                                       else s b ((x,y)::l2) (a,1);;
                                           
let rec print_list l i = if i = 0 then ()
                                  else match l with (a,b)::c -> (print_string ("("^a^","^(string_of_int b)^")\n"); print_list c (i-1))
                                                   |[] -> ();;
                                                                                               
let rec lis1 l1 l2 (a,b) = match l1 with [] -> l2
                                        |(x,y)::c -> if y>=b then lis1 c ((x,y)::l2) (a,b) 
                                                             else lis1 c l2 (a,b);;            
let rec lis2 l1 l2 (a,b) = match l1 with [] -> l2
                                        |(x,y)::c -> if y<b then lis2 c ((x,y)::l2) (a,b) 
                                                             else lis2 c l2 (a,b);;
let rec sort l = match l with [] -> []
                             |a::b->(sort (lis1 b [] a))@[a]@(sort (lis2 b [] a));;
                                   
let l = sort l;;

print_list l 10;;


let (x,y) = match l with a::b->a
                        |_->("",0);;

print_string (x^" — "^(string_of_int y));;

                                                                                                 

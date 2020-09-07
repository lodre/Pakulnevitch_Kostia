let rec c s1 s2 i = if String.length s1 <= i  then (s1,s2)
                                              else if String.length s2 <= i then (s2,s1)
                                                                            else (if s1.[i]=s2.[i] then (c s1 s2 (i+1))
                                                                                                   else (if int_of_char(s1.[i])>int_of_char(s2.[i]) then (s2,s1)
                                                                                                                                                    else (s1,s2)));;
let rec lis1 l a = match l with [] -> []
                               |x::b->if x = snd (c x a 0) then x::(lis1 b a) else (lis1 b a);;
let rec lis2 l a = match l with [] -> []
                               |x::b->if (x = fst (c x a 0) && not (x = a)) then x::(lis2 b a) else (lis2 b a);;
let rec sort l = match l with [] -> []
                             |a::b->(sort (lis1 b a))@[a]@(sort (lis2 b a));;

let rec s l (x,y) = match l with [] -> [(x,y)]
                                |a::b -> if x = a then s b (x,y+1)
                                                  else s b (a,1);;

let rec maxi l (x,y) = match l with []->(x,y)
                              |(a,b)::c->if y>b then maxi c (x,y)
                                                else maxi c (a,b);; 

let l = ["aaa";"bbb";"aaa"];;
let l = sort l;;
let l = match l with a::b-> s b (a,1)
                    |[]->[];;
let (x,y) = maxi l ("",0);;

print_string (x^"\n"^(string_of_int y));;
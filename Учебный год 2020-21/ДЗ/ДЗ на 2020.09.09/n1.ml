(*  1 - только в начале
    0 - в каком-то месте текста с мал
    2 - в каком-то месте текста с бол*)

let f = open_in "n1.txt";;

let cap s = if (s.[0]>='А' && s.[0]<='Я') then 0
                                          else 1;;

let rec c s1 s2 i = if String.length s1 <= i  then (s1,s2)
                                              else if String.length s2 <= i then (s2,s1)
                                                                            else (if s1.[i]=s2.[i] then (c s1 s2 (i+1))
                                                                                                   else (if int_of_char(s1.[i])>int_of_char(s2.[i]) then (s2,s1)
                                                                                                                                                    else (s1,s2)));;

let rec m x = max x (-x);; 

let eq s1 s2 = (String.sub s1 1 ((String.length s1) - 1)) = (String.sub s2 1 ((String.length s2) - 1)) && (m ((int_of_char s1.[0]) - (int_of_char s2.[0])) = 32 ||m ((int_of_char s1.[0]) - (int_of_char s2.[0])) = 80 )

let rec insert l x y = 
let z = (if cap x = 0 then (if y = 0 then 1 else 2) else 0) in
                       match l with ((a,b),c)::d -> if x = a then ((a,b*z),c+1)::d
                                                             else ((a,b),c)::(insert d x y)
                                   |[] -> ((x,z),1)::[];; 


let rec words s i = if i < String.length s then (if (s.[i]<'A') then ""
                                                                else (String.make 1 (s.[i]))^(words s (i+1)))
                                           else "";;
let rec next1 s i j = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1) (j*(if s.[i] = ' ' then 1 else 0))
                                                                  else (i,j))
                                             else (i,j);;
let rec next s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1) 1
                                                               else next s (i+1))
                                          else (i,1);;
let rec words_list l s i = if i < String.length s then insert (words_list l s (fst (next s i))) (words s i) (snd (next s i))
                                                  else l;;      

let rec read1 l = (try
                      let y = input_line f in let x = words_list l y 0 in
                      (fun a -> (read1 x))
                  with end_of_file->(fun a ->l)) ();;
let l = read1 [];;

let rec f l = match l with ((a,b),c)::d ->(match b with 0 -> f d
                                                       |1 -> (a,c) :: f d
                                                       |_ -> (a,c) :: (f d))
                          | _ -> [];;

let l = f l;;

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

print_list l 20;;


let (x,y) = match l with a::b->a
                        |_->("",0);;

print_string (x^" — "^(string_of_int y));;

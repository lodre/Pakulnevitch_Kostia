let rec read1 s1 s2 i = if i<String.length s1 then (if s1.[i]<'0' then read1 s1 s2 (i+1)
                                                                  else s2,i)
                                              else (s2,i);;

let rec read s1 s2 i = if i<String.length s1 then (if s1.[i]<'0' then read1 s1 s2 (i+1)
                                                                 else read s1 (10*s2+((int_of_char s1.[i])-48)) (i+1))
                                             else (s2,i);;  
let s = read_line ();;                           
let n = (fst (read s 0 0));;
let m = (fst (read s 0 (snd (read s 0 0))));;  

let rec read2 l i = if i>0 then read2 (let s = read_line () in ((fst (read s 0 0))-1,(fst (read s 0 (snd (read s 0 0))))-1)::l) (i-1)
                           else l;; 

let l = read2 [] m;;
                                  
let q = read_int ();;
     
let a = Array.make n true;; 

let rec read0 l s x i = if x > 0 then ( read0 (l@(((fst (read s 0 i))-1) :: [])) s (x-1) (snd (read s 0 i)))
                                 else l;; 
                                         
let l2 = read0 [] (read_line ()) q 0;;                 
                                        
let rec part a l i = match l with x::b -> if a.(n-1-i) then x::(part a b (i+1))
                                                       else part a b (i+1)
                                 |[] -> [];;
        
let rec iter l f = match l with a::b -> (f a; iter b f)
                               |[] -> ();;

let rec del b l x = 
(b.(x)<-false; iter l (fun (a,c) -> (if a = x then (if b.(c) then del b l c else ()) else (if x = c then (if b.(a) then del b l a else ()) else ()))));;

let rec count b l x = if x<n then (if b.(x) then (del b l x;1) else 0) + (count b l (x+1))
                             else 0;;
let rec print l2 = match l2 with x::b -> (a.(x)<-false;print_int (count (Array.make n true) (part a l 0) 0);print_string " "; print b)
                                |[] -> ();;

print l2;;                            
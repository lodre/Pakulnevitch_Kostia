let a = Sys.readdir ".";;

let rec insert l x = match l with (a,b)::c -> if x = a then (a,b+1)::c
                                                       else (a,b)::(insert c x)
                                 |[] -> (x,1)::[];; 
(*
let rec words s i = if i < String.length s then (if (s.[i]<'A') then ""
                                                                else (String.make 1 (s.[i]))^(words s (i+1)))
                                           else "";;
let rec next1 s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1)
                                                                else i)
                                           else i;;
let rec next s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1)
                                                               else next s (i+1))
                                          else i;;
let rec words_list l s i = if i < String.length s then insert (words_list l s (next s i)) (words s i)
                                                  else l;;      
               
let rec len f = 
let rec read1 l = (try
                      let y = input_line f in let x = words_list l y 0 in
                      (fun a -> (read1 x))
                  with end_of_file->(fun a ->l)) () in
let l = read1 [] in
List.length l;;
                 *)
let rec next1 s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1)
                                                                else i)
                                           else i;;
let rec next s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1)
                                                               else next s (i+1))
                                          else i;;
let rec words_count s i = if i < String.length s then (words_count s (next s i))+1
                                                 else 0;;      
                                  
let rec len f = 
let rec read1 s = (try
                      let y = input_line f in let x = words_count y 0 in
                      (fun a -> (read1 (x+s)))
                  with end_of_file->(fun a -> s)) () in
read1 0;;                        

                                      


let suits_us x =
            String.length x >= 4 &&
            String.sub x (String.length x - 4) 4 = ".txt";;

let rec lis l a i = if i<Array.length a then (let s = a.(i) in if suits_us s then lis (s::l) a (i+1)
                                                                             else lis l a (i+1))
                                        else l;;
            
let rec map l1 l2 = match l1 with a::b-> let f = open_in a in let x = len f in (close_in f;map b (x::l2))
                                 |[]->l2;;

let l = map (lis [] a 0) [];;

let rec avr l s n = match l with a::b-> avr b (s+a) (n+1)
                                |[]-> (float s)/.(float n);;

print_float (avr l 0 0);;
let p = 4294967297;;
let k = 11;;

let hash x =
let rec h s x i = 
	if i<String.length x then h ((s*k+(int_of_char x.[i])) mod p) x (i+1)
                             else s in
	h 0 x 0;;  

type 'a opt = Empty
             |Deleted
             |Occupied of 'a;;
type ('a,'b) t = (('a*'b) opt) array ref;;

let create hfunc size = ref (Array.make size Empty);;
let add array key value = 
	let h = (hash key) mod (Array.length !array) in
	let rec f i =
		match !array.(i) with Empty|Deleted -> (!array.(i)<-Occupied (key,value);None)
                                     |Occupied (x,y) -> if x = key then (!array.(i)<-Occupied (key,value);Some y)
								   else f ((i+1) mod (Array.length !array)) in
	f h;;
                                                     
let mem array key =
	let h = (hash key) mod (Array.length !array) in                      
	let rec f i =
		match !array.(i) with Empty -> false
				     |Deleted -> f ((i+1) mod (Array.length !array)) 
                                     |Occupied (x,y) -> if x = key then true
                                                                    else f ((i+1) mod (Array.length !array)) in
	f h;;
                                                                                                    
let find array key =
	let h = (hash key) mod (Array.length !array) in                      
	let rec f i =
		match !array.(i) with Empty -> None
				     |Deleted -> f ((i+1) mod (Array.length !array)) 
                                     |Occupied (x,y) -> if x = key then Some y
                                                                    else f ((i+1) mod (Array.length !array)) in
	f h;;


let delete array key = 
	let h = (hash key) mod (Array.length !array) in                      
	let rec f i =
		match !array.(i) with Empty -> None
				     |Deleted -> f ((i+1) mod (Array.length !array)) 
                                     |Occupied (x,y) -> if x = key then (!array.(i)<-Deleted;Some y)
                                                                    else f ((i+1) mod (Array.length !array)) in
	f h;;


let iter array fn = 
	for i = 0 to (Array.length !array) - 1 do
		match !array.(i) with | Occupied p -> fn p
                                      | _ -> ()
	done;;
                             
        
let rec fold array f x =
	let y = ref x in
		for i = 0 to (Array.length !array) - 1 do
			match !array.(i) with Occupied x -> y := f x !y
                                             | _ -> ()
		done; 
	!y;;
                                             
let rec add_word t w = let f = find t w in match f with None -> add t w 1
                                                       |Some x -> add t w (x+1);;

let f = open_in "n1.txt";;
                                                                                       
let rec next1 s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1)
                                                                else i)
                                           else i;;
let rec next s s1 i = if i < String.length s then (if (s.[i]<'A') then (s1,next1 s (i+1))
                                                                  else next s (s1^(String.make 1 s.[i])) (i+1))
                                          else (s1,i);;
let rec words_count a s i = if i < String.length s then (let x = next s "" i in (add_word a (fst x);words_count a s (snd x)))
                                                   else ();;      

let rec read a = try
                     let s = input_line f in
                     (words_count a s 0;read a)
                 with end_of_file->();;

let rec max l1 l2 (x,y) = match l1 with (a,b)::c -> if b>y then max c ((x,y)::l2) (a,b)
                                                           else max c ((a,b)::l2) (x,y)
                                       |[] -> ((x,y),l2);;

let rec print_list l i = if i>0 then (match l with (x,y)::z -> (let ((a,b),l2) = max z [] (x,y) in print_string "(";print_string a;print_string ",";print_int b;print_string ")\n";print_list l2 (i-1))
                                                  |[] -> ())
                                else ();;

let t1 = Unix.gettimeofday ();;
let a = create hash 65536;;
read a;;
let l = fold a (fun (a,b) -> fun l -> (a,b)::l) [];;
print_list l 20;;
let t2 = Unix.gettimeofday ();;
print_string "time:";;
print_float (t2-.t1);;


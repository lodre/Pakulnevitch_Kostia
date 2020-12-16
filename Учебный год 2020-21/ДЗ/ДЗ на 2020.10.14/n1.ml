let p = 4294967297;;
let k = 11;;

let hash x =
let rec h s x i = if i<String.length x then h ((s*k+(int_of_char x.[i])) mod p) x (i+1)
                                       else s in
h 0 x 0;;  

type ('a,'b) t = ('a->int) * ('a*'b) list array;;

let create hfunc size = (hfunc, Array.make size []);;
let add (hash, array) key value = 
	let h = (hash key) mod (Array.length array) in
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) array.(h) in
	array.(h) <- (key,value) :: temp_list;
	match old_value with
		[] -> None
	      | [(k,v)] -> Some v
	      | _ ->failwith ">= 2 equal values!";;
                                                     
let mem (hash, array) key =
	let h = (hash key) mod (Array.length array) in
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) array.(h) in 
	match old_value with
		[] -> false
	      | [(k,v)] -> true
	      | _ ->failwith ">= 2 equal values!";;

let find (hash, array) key =
	let h = (hash key) mod (Array.length array) in
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) array.(h) in 
	match old_value with
		[] -> None
	      | [(k,v)] -> Some v
	      | _ ->failwith ">= 2 equal values!";;


let delete (hash, array) key = 
	let h = (hash key) mod (Array.length array) in
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) array.(h) in
	array.(h) <- temp_list; 
	match old_value with
		[] -> None
	      | [(k,v)] -> Some v
	      | _ ->failwith ">= 2 equal values!";;


let iter (hash, array) fn = 
	for i = 0 to (Array.length array) - 1 do
		List.iter fn array.(i) 
	done;;
                             
        
let rec fold (hash, array) f x =
	let rec lfold l f x = 
	match l with
	|(a,b)::c -> lfold c f (f (a,b) x) 
	|[] -> x in
		let y = ref x in
		for i = 0 to (Array.length array) - 1 do
			y := lfold (array.(i)) f !y
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
let t2 = Unix.gettimeofday ();;
print_list l 20;;                          
print_string "time:";;
print_float (t2-.t1);;

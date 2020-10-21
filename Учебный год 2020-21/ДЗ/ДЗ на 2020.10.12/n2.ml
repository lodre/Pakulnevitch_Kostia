let p = 4294967297;;
let k = 11;;

let hash x =
let rec h s x i = if i<String.length x then h ((s*k+(int_of_char x.[i])) mod p) x (i+1)
                                       else s in
h 0 x 0;;  

type ('a,'b) t = ('a*'b) list array ref;;

let create hfunc size = ref (Array.make size []);;
let add array key value = 
	let h = (hash key) mod (Array.length !array) in
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) !array.(h) in
	!array.(h) <- (key,value) :: temp_list;
	match old_value with
		[] -> None
	      | [(k,v)] -> Some v
	      | _ ->failwith ">= 2 equal values!";;
                                                     
let mem array key =
	let h = (hash key) mod (Array.length !array) in
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) !array.(h) in 
	match old_value with
		[] -> false
	      | [(k,v)] -> true
	      | _ ->failwith ">= 2 equal values!";;

let find array key =
	let h = (hash key) mod (Array.length !array) in
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) !array.(h) in 
	match old_value with
		[] -> None
	      | [(k,v)] -> Some v
	      | _ ->failwith ">= 2 equal values!";;


let delete array key = 
	let h = (hash key) mod (Array.length !array) in
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) !array.(h) in
	!array.(h) <- temp_list; 
	match old_value with
		[] -> None
	      | [(k,v)] -> Some v
	      | _ ->failwith ">= 2 equal values!";;


let iter array fn = 
	for i = 0 to (Array.length !array) - 1 do
		List.iter !array.(i) fn
	done;;
                             
        
let rec fold array f x =
	let rec lfold l f x = 
	match l with
	|(a,b)::c -> lfold c f (f (a,b) x) 
	|[] -> x in
		let y = ref x in
		for i = 0 to (Array.length !array) - 1 do
			y := lfold (!array.(i)) f !y
		done; 
	!y;;


let a = create hash 1000;;
add a "abc" 1023;; 
add a "cba" 1025;; 
mem a "abb";;
mem a "abc";;
find a "abb";;
find a "abc";;
delete a "cba";;   
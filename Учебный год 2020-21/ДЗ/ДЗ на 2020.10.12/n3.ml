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
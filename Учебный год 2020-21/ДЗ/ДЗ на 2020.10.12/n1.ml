type ('a,'b) t = ('a*'b) list ref;;

let create hfunc size = ref [];;
let add list key value =
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) !list in
	list := (key,value) :: temp_list;
	match old_value with
		[] -> None
	      | [(k,v)] -> Some v
	      | _ ->failwith ">= 2 equal values!";;
                                                     
let mem list key =
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) !list in 
	match old_value with
		[] -> false
	      | [(k,v)] -> true
	      | _ ->failwith ">= 2 equal values!";;

let find list key =
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) !list in 
	match old_value with
		[] -> None
	      | [(k,v)] -> Some v
	      | _ ->failwith ">= 2 equal values!";;
           

let delete list key = 
	let (old_value, temp_list) = List.partition (fun (a,b) -> a = key) !list in
	list := temp_list; 
	match old_value with
		[] -> None
	      | [(k,v)] -> Some v
	      | _ ->failwith ">= 2 equal values!";;

let iter list fn = List.iter fn !list;;
                                       
let rec fold list f x = match list with a::b -> fold b f (f a x)
                                       |[]-> x;;
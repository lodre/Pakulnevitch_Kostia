let s = "192.168.1.0";;

let rec make_string s i j = if i < j then (String.make 1 s.[i])^(make_string s (i+1) j)
                                     else "";;
let rec next s i = if i = String.length s then i
                                          else (if s.[i] = '.' then i
                                                               else next s (i+1));; 
let rec number s i = int_of_string (make_string s i (next s i));;
let rec numbers s i j = if j > 0 then ((number s i):: numbers s ((next s i) + 1) (j-1))
                                 else [];;

let l = numbers s 0 4;;

let rec in_int l x = match l with a::b->in_int b ((x*256) + a)
                                 |[]->x;;

let x = in_int l 0;;
	
print_int x;;
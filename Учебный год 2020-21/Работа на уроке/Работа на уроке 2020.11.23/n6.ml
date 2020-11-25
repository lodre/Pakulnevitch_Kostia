type 'a tree = Leaf| Node of ('a tree)*('a tree)*'a;;

let rec is_pos l x = match l with a::b-> is_pos b (x+.(1./.(2.**(float a))))
                                 |[]-> x = 1.;;

let rec m1 l = match l with a::b -> (a-1)::(m1 b)
                           |[] -> [];;

let rec listpart l1 l2 s = if s = 0.5 then (m1 l1,l2) 
                                      else match l1 with [] -> failwith ""
                                                        |a::b -> listpart b ((a-1)::l2) (s+.(1./.(2.**(float a))));;

let lp l = listpart (List.sort (fun x -> fun y -> x-y) l) [] 0.;;

let rec make_tree l = if l = [] then Leaf
                                else if l =[0] then Leaf
                                               else (let l1,l2 = lp l in Node (make_tree l1, make_tree l2, 1));;


let l = [1;3;4;4;4;5;5;5;5;5;5];;

let t = make_tree l;;



let rec print_prefix prefix =
match prefix with
| [] -> ()
| [true] -> print_string "+--"
| [false] -> print_string "\\--"
| true::p -> print_string "|  " ; print_prefix p
| false::p ->print_string "   " ; print_prefix p;;

let print_indent s prefix =
print_prefix prefix;
print_string (s^"\n");;

let rec print_tree node prefix =
match node with
| Leaf -> print_indent "*" prefix
| Node (l,r,n) -> print_indent (string_of_int n) prefix;
print_tree l (prefix @ [true]);
print_tree r (prefix @ [false]);;

let rec full_tree n m =
if n > 0 then Node (full_tree (n-1) (2*m+0), full_tree (n-1) (2*m+1), m)
else Leaf;;

print_tree t [];;
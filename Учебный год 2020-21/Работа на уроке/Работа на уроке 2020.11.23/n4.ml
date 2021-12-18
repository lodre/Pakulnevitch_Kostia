type 'a tree = Leaf| Node of ('a tree)*('a tree)*'a;;

let rec make_bamboo n x = if n>0 then if x mod 2 = 0 then Node (make_bamboo (n-1) (x/2),Leaf,n)
                                                     else Node (Leaf,make_bamboo (n-1) (x/2),n)
                                 else Leaf;; 

let t = make_bamboo 10 8134814;;

let rec print_prefix prefix =
match prefix with
| [] -> ()
| [true] -> print_string "+--"
| [false] -> print_string "\\--"
| true::p -> print_string "|   " ; print_prefix p
| false::p -> print_string "   " ; print_prefix p;;

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
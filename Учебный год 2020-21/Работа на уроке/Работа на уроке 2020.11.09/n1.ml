type tree = Tree of tree list;;
let s = "(((()))()(()()())())";;

let parse s =
let rec parse1 s l i =                        
if i<String.length s then if s.[i] = '(' then (let (tl,n) = parse1 s [] (i+1) in parse1 s (l@[tl]) n)
                                         else (Tree l,i+1)
                     else (Tree l,i+1) in
parse1 s [] 0;;

let (t,i) = parse s;;

let rec print_tree (Tree l) = print_string "Tree ["; print_list l; print_string "]"
and print_list l = match l with [] -> ()
                               |a::[] -> print_tree a
                               |a::b -> print_tree a; print_string ";"; print_list b;;

print_tree t;;
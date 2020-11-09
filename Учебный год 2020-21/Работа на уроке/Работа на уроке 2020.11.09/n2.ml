type tree = Tree of tree list;;
let t = Tree [Tree [Tree [Tree [Tree []]]; Tree []; Tree [Tree []; Tree []; Tree []]; Tree []]];;
let rec print_tree t = 
match t with Tree [] -> print_string ""
            |Tree (a::b) -> print_string "(";print_tree a;print_string ")";print_tree (Tree b);;

print_string "(";print_tree t;print_string ")";;                                                                                                
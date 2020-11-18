type tree = Tree of tree list;;
let t = Tree [Tree []; Tree [Tree []]; Tree []];;

let rec make_string s i = if i = 0 then ""
                                   else s^(make_string s (i-1));;

let rec print_tree t i =                                                
match t with Tree []      -> ()
            |Tree (a::[]) -> (print_string ((if i = 0 then ""
                                                      else (make_string "| " i))^"\\-*\n"); print_tree a (i+1))
            |Tree (a::b)  -> ((print_string ((if i = 0 then ""
                                                       else (make_string "| " i))^"+-*\n"); print_tree a (i+1));print_tree (Tree b) i);;

print_string "*\n";;
print_tree t 0;;                                                                                                 
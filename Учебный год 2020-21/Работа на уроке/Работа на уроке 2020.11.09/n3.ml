type tree = Tree of tree list;;
let t = Tree [Tree []; Tree [Tree [Tree [];Tree []]]; Tree []; Tree[]; Tree[Tree[Tree[]]]];;

let rec make_string l = match l with a::b -> (make_string b)^(if a = 1 then "| "
                                                                       else "  ")
                                    |[] -> "";;
                                                                            (*
let rec print_tree t i =                                                    
match t with Tree []      -> ()
            |Tree (a::[]) -> (print_string ((if i = 0 then ""
                                                      else (make_string "| " i))^"\\-*\n"); print_tree a (i+1))
            |Tree (a::b)  -> ((print_string ((if i = 0 then ""
                                                       else (make_string "| " i))^"+-*\n"); print_tree a (i+1));print_tree (Tree b) i);;
                                                                              *)

let rec print_tree t l =                                                    
match t with Tree []      -> ()
            |Tree (a::[]) -> (print_string ((if l = [] then ""
                                                      else (make_string l))^"\\-*\n"); print_tree a (0::l))
            |Tree (a::b)  -> (print_string ((if l = [] then ""
                                                       else (make_string l))^"+-*\n"); print_tree a (1::l);print_tree (Tree b) l);;
                                                                              
print_string "*\n";;
print_tree t [];;                                                                                                 
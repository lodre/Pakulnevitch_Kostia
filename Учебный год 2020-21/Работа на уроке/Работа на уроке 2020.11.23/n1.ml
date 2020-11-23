type 'a tree = Leaf| Node of ('a tree)*('a tree)*'a;;

let t = Node (Leaf,Node (Leaf,Node (Leaf,Node (Leaf,Node (Leaf,Node (Leaf,Leaf,1),1),1),1),1),1);;

let rec is_bamboo t = match t with Node (Leaf,t2,x) -> is_bamboo t2
                                  |Node (t1,Leaf,x) -> is_bamboo t1
                                  |Leaf -> true
                                  |_-> false;;

let rec print_bool b = print_string (if b then "True" else "False");;

let b = is_bamboo t;;

print_bool b;;

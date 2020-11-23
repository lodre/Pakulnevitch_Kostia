type 'a tree = Leaf| Node of ('a tree)*('a tree)*'a;;


let t = Node (Node (Node (Leaf,Leaf,1),Node (Leaf,Leaf,1),1),Node (Node (Leaf,Leaf,1),Leaf,1),1);;

let is_balanced t = 
let rec f t i = match t with Leaf -> (i,i)
                            |Node (t1,t2,x) -> (let (x1,y1) = f t1 (i+1) in let (x2,y2) = f t2 (i+1) in (min x1 x2, max y1 y2)) in
let (x,y) = f t 0 in
y-x<2;;

let rec print_bool b = print_string (if b then "True" else "False");;

let b = is_balanced t;;

print_bool b;;

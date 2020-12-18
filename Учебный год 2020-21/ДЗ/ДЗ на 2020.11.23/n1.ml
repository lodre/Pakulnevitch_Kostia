type ('k,'v) tree = Node of ('k,'v) tree * ('k,'v) tree * ('k * 'v)
                   |Leaf;;
                                            
let rec mem t k = match t with Node (t1,t2,(k1,v1)) -> if k1 = k then true else ((mem t1 k)||(mem t2 k))
                              |Leaf -> false;;

let add t k v = 
let rec add1 t k v = match t with Node (t1,t2,(k1,v1)) -> Node (add1 t1 k v, t2, (k1,v1)) 
                                 |Leaf -> Node (Leaf,Leaf,(k,v)) in
if mem t k then t
else add1 t k v;;
                   

let rec find t k = match t with Node (t1,t2,(k1,v1)) -> if k1 = k then Some v1 else (match find t1 k with Some x -> Some x | None -> (find t2 k))
                                |Leaf -> None;;

let rec split t1 t2 = match t1 with Node (Leaf,Leaf,x) -> (Node (Leaf,t2,x))
                                   |Node (Leaf,t3,x) -> split (Node (t3,Leaf,x)) t2
                                   |Node (Node (t3,t4,x1),t5,x2)-> Node (split (Node (t3,t4,x1)) t5, t2, x1)
                                   |Leaf -> Leaf;;

let rec delete t k = match t with Node (t1,t2,(k1,v1)) -> if k = k1 then (if t1 = Leaf then t2 else split t1 t2) else (Node (delete t1 k,delete t2 k,(k1,v1)))
                                 |Leaf -> Leaf;;
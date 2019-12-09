type tree = |Node of tree*tree
            |Leaf of float;;
let t = Node (Leaf 0.4, Node (Leaf 0.3, Node (Leaf 0.1, Leaf 0.2)));;
let rec sum t i = match t with Node (t1,t2) -> (sum t1 (i+.1.)) +. (sum t2 (i+.1.))
                                 |Leaf x-> x*.i;;     
print_float (sum t 0.);;                     
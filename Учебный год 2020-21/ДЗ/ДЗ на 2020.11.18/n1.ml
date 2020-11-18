type 'a tree = Leaf| Node of ('a tree)*('a tree)*'a;;
                                          

let rec mem t a = match t with Node (l,r,n) ->if a<n then mem l a
                                                     else if a>n then mem r a
                                                                 else true 
                              |Leaf -> false;;

 
let rec add t a = match t with Node (l,r,n) ->if a<n then Node ((add l a),r,n)
                                                     else if n=a then t
                                                                 else Node (l,(add r a),n)
                              |Leaf -> Node(Leaf,Leaf,a);;


let sum_tree l r =
let rec del_max t = match t with Node (t1,t2,n) -> (let x = (if t2 = Leaf then (Leaf,n) else del_max t2) in (Node (t1, fst x, n), snd x))
                                | _-> failwith "" in
Node (l, fst (del_max r), snd (del_max r));; 

let rec delete t a = match t with Node (l,r,n) ->if a<n then Node ((delete l a),r,n)
                                                     else if a>n then Node (l,(delete r a),n)
                                                                 else (if r = Leaf then l
                                                                                   else sum_tree l r) 
                              |Leaf -> Leaf;;

let rec string_of_tree f t = match t with Leaf -> " Leaf"
                                         |Node (l,r,n) -> "("^(string_of_tree f l)^", "^(string_of_tree f r)^", "^(f n)^")"

let rec print_bool b = print_string (if b then "true\n" else "false\n");;



let t = Node (Leaf,Leaf,1);;    
print_bool (mem t 2);;
let t = add t 2;;     
print_bool (mem t 2);;
let t = delete t 2;;
print_bool (mem t 2);;
let t = add t 2;;     
let t = add t 3;;     
let t = add t 0;;     
print_string (string_of_tree string_of_int t);;
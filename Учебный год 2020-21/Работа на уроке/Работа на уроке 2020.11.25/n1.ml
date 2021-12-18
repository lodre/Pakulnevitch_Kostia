type 'a tree = Leaf|Bnode of ('a tree)*('a tree)*'a|Rnode of ('a tree)*('a tree)*'a;;

let rec add t x =
	match t with Leaf -> Rnode (Leaf,Leaf,x)                                    
                    | Bnode (l,r,n) -> if x<n then Bnode (add l x, r n)
                                              else if x=n then t
                                                          else Bnode (l, add r x, n)
                    | Rnode (l,r,n) -> if x<n then Rnode (add l x, r n)
                                              else if x=n then t
                                                          else Rnode (l, add r x, n);;

let rec f2 x i = if i>0 then (f2 (x/2) (i-1)) @ [(x mod 2)]
                        else [];;

let rec serialize l x y = (f2 y x) @ l ;;

let l = [254;178];;

let rec map f l = match l with a::b->(f a) @ (map f b)
                              |[]->[];;

map (serialize [] 8) l;;
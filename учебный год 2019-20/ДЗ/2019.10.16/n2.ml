let l = [10;10;20;30;15;6;9];;
let rec iter f l x =match l with a::b->iter f b ((f a) +. x)
                                |[]->x;;     
let rec map f l = match l with a::b->(f a)::(map f b)
                              |[]->[];;
let s = iter (fun x -> float x) l 0.;;
let l = map (fun x -> (float x)/.s) l;;
let rec iter f l x =match l with a::b->iter f b ((f a) +. x)
                                |[]->x;;     
let log2 x = (log x) /. (log 2.);;
let f x = x*.(log2 x);;
let x = -. (iter f l 0.);;
print_float x;; 

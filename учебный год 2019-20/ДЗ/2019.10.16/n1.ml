let l = [0.1;0.1;0.2;0.3;0.15;0.06;0.09];;
let rec iter f l x =match l with a::b->iter f b ((f a) +. x)
                                |[]->x;;     
let log2 x = (log x) /. (log 2.);;
let f x = x*.(log2 x);;
let x = -. (iter f l 0.);;
print_float x;; 

let f = open_in_bin (Sys.argv.(1));;
let rec insert l1 x l2= match l1 with (a,b)::c->if a = x then (a,(b+1))::c else insert c x ((a,b)::l2)
                                     |[]->(x,1)::l2;;

let make_int f = let rec byt x i = if i>0 then byt ((x*64)+((input_byte f) mod 64)) (i-1) else x in
                  let b = input_byte f in 
                  if b < 128 then b 
                             else (if b<192 then failwith "1"
                                            else(if b<224 then (b mod 32) + (byt 0 1) + 128  
                                                          else (if b<240 then (b mod 16) + (byt 0 2) + 224
                                                                         else (if b > 247 then failwith "2"
                                                                                          else (b mod 8) + (byt 0 3) + 512))));;
let rec make_list l= try 
                        let x = make_int f in make_list (insert l x [])
                     with _->l;;
let l = make_list [];;
let rec map f l = match l with a::b->(f a)::(map f b)
                              |[]->[];;
let l = map (fun (x,y)-> y) l;; 

let rec iter f l x =match l with a::b->iter f b ((f a) +. x)
                                |[]->x;;     
let s = iter (fun x -> float x) l 0.;;
let l = map (fun x -> (float x)/.s) l;;
let rec iter f l x =match l with a::b->iter f b ((f a) +. x)
                                |[]->x;;     
let log2 x = (log x) /. (log 2.);;
let f x = x*.(log2 x);;
let x = -. (iter f l 0.);;
print_float x;;
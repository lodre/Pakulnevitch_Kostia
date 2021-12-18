type l = Var of string
       | App of l*l
       | Abs of string*l;;

let s = "(\\x.(\\y.(y x)))";;           
let rec parse s =
let rec next s i = if i = String.length s then i-1
              else match s.[i] with '.' -> i+1
                                   |' ' -> i+1
                                   |')' -> i+1
                                   | _  -> next s (i+1) in
let rec var s i = if i = String.length s then ""
             else match s.[i] with ' ' ->""
                                  |')' ->""
                                  |'.' ->""
                                  | x  ->(String.make 1 x)^(var s (i+1)) in
let rec  parse1 s i = match s.[i] with |'('-> (if s.[i+1] = '\\' then (((let x = var s (i+2) in Abs (x,fst (parse1 s (next s (i+1)))))), next s (next s i))
                                                                 else (let x = parse1 s (i+1) in (App (fst x, fst (parse1 s (snd x)))),(snd (parse1 s (snd x)))))
                                       | _->let x = var s i in (Var x,next s i) in 

parse1 s 0;;

let t = parse s;;

let rec print t = match t with Var x -> print_string x
                              | App (x, y) -> (print_string "(";print x;print_string " ";print y;print_string ")")
                              | Abs (x,y) -> (print_string ("(\\"^x^"."); print y; print_string ")");;

print (fst t);;
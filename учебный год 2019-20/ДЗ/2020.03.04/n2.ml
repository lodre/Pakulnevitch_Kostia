type l = Var of string
       | App of l*l
       | Abs of string*l;;

let t1 =Abs ("x",Var "y");;
let t2 =Abs ("y",Var "x");;
       
let a =[|1|];;
                 
let rec n i = if i>0 then (String.make 1 (char_of_int (i mod 256)))^(n (i/256))
                     else ".";;
                          
let rec insert a b t = match t with Var x -> Var (if a = x then b else x)
                                   |App (x,y) -> App (insert a b x,insert a b y)
                                   |Abs (x,y) -> if x = a then Abs (x,y) else Abs (x,insert a b y);; 

let rec f t1 t2 = match t1,t2 with Var x, Var y -> x = y
                                  |App (a, b),App (c, d) -> (f a c) && (f b d)
                                  |Abs (x, y),Abs (c, d)->let w = n (a.(0)) in (a.(0)<-a.(0)+1;(f (insert x w y) (insert c w d)))
                                  |_-> false;;

let b = f t1 t2;;
print_string (if b then "true" else "false");;
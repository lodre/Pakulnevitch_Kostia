let l1 = [1;0;-1;0;1];;
let l2 = [1;0;-1;0;1];;

let rec mod3 x = if x >= 0 then x mod 3
                           else ((x+9) mod 3);;

let rec del3 x = if x >= 0 then x/3
                           else ((x+9)/3)-3;;

let rec plus l1 l2 = match l1 with a::b->plus b (a::l2)
                                  |[]->l2;;

let rec sum1 l1 l2 l = match l1,l2 with a1::b1,a2::b2 ->sum1 b1 b2 ((a1 + a2) :: l)
                                       |l1,[] -> plus l1 l
                                       |[],l2 -> plus l2 l
                                       |[],[] -> l;;
let rec sum2 l i = match l with a::b->((mod3 (a+i+1))-1)::(sum2 b (del3 (a+i+1)))
                               |[]-> if i = 0 then []
                                              else ((mod3 (i+1))-1)::sum2 [] (del3 (i+1));; 
let l = plus (sum2 (sum1 l1 l2 []) 0) [];;
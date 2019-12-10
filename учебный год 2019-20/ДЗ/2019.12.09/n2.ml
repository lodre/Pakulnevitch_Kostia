let a = [| [|0;1;1|];
           [|0;0;1|];
           [|0;0;0|] |];;
let rec f1 a i j = try 
                      if a.(i).(j) = 0 then f1 a (i+1) j
                                       else false
                   with _->true;;
let rec f2 a j = if j < Array.length a then if f1 a 0 j then j::(f2 a (j+1)) 
                                                        else (f2 a (j+1))
                                       else [];;
let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();; 
print (f2 a 0);;
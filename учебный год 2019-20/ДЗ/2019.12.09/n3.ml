let a = [| [|0;1;1|];
           [|0;0;1|];
           [|0;0;0|] |];;
let rec f1 a i j = try 
                      if a.(i).(j) = 0 then f1 a (i+1) j
                                       else 1 + (f1 a (i+1) j)
                   with _->0;;
let rec f2 a i j = try 
                      if a.(j).(i) = 0 then f2 a (i+1) j
                                       else 1 + (f2 a (i+1) j)
                   with _->0;;

let rec f3 a j = if j < Array.length a then ((f1 a 0 j) , (f2 a 0 j))::(f3 a (j+1))
                                       else [];;
let rec print l =
let rec print1 l = match l with (a1,a2)::b->(print_string ";(";print_int a1; print_string ",";print_int a2;print_string ")";print1 b)
                               |_-> print_string "]" in 
match l with (a1,a2)::b->(print_string "[";print_string "(";print_int a1; print_string ",";print_int a2;print_string ")";print1 b)
            |[]->();; 
print (f3 a 0);;
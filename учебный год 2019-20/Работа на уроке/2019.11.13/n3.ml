let rec deserialize l x = 
let rec deserialize2 l x y = if x>0 then match l with a::b-> deserialize2 b (x-1) (a + (2 * y)) 
                                                     |[]->(y,l)
                                    else (y,l) in
 deserialize2 l x 0;;

let l = [1;1;1;1;1;1;1;0;1;0;1;1;0;0;1;0];;

let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();; 

let rec split_to_bytes l1 l2 =
let (a,b) = deserialize l1 8 in
if b = [] then a::l2
          else a::(split_to_bytes b l2);;
let l = split_to_bytes l [];;
print l;;
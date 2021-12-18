let n = 3;;           
let rec comp1 x l2 = match l2 with a::b->(("("^x^","^a^")"))::(comp1 x b)
                                  |[]->[];;
let rec comp l1 l2 = match l1 with a::b-> (comp1 a l2)@(comp b l2)
                                  |[]->[];;
let rec map f n = if n>=0 then (f n) @ (map f (n-1)) else [];;
let rec step n = if n>0 then map (fun x -> comp (step x) (step (n-x-1))) (n-1)
                        else ["*"];;

let rec print l = match l with a::b->(print_string "\n";print_string a;print b)
                              |[]->();;
print (step n);;
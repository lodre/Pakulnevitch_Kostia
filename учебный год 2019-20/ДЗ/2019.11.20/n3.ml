let l = ["010";"011";"100";"110"];;     
let rec f1 a b i j = if j>=i then true else (if a.[j]=b.[j] then f1 a b (j+1) i
                                                            else false);;
let rec useful l s i = match l with a::b-> if i<String.length a then (if a.[i] = s.[i] then useful b s i
                                                                                       else (if f1 a s i 0 then true
                                                                                                           else useful b s i))
                                                                else useful b s i  
                                   |[]-> false;;                                                    
let rec make1 s a i = if i<String.length a then make1 (if useful l a i then (s^(String.make 1 (a.[i])))
                                                                       else s) a (i+1)
                                           else s;;

let rec make l = match l with a::b->(make1 "" a 0)::(make b)
                             |[]->[];;
let ln = make l;;
let rec print_list l = 
let rec print_list1 l = match l with a::b->(print_string (a^";");print_list1 b)
                                    |_->() in
(print_string "[";print_list1 l;print_string "]");;
print_list ln;;
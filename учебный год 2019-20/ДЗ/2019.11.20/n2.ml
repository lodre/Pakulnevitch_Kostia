let l = ["01";"0";"1"];;     
let rec f1 a b i j = if j>=i then true else (if a.[j]=b.[j] then f1 a b (j+1) i
                                                            else false);;
let rec useful l s i = match l with a::b-> if i<String.length a then (if a.[i] = s.[i] then useful b s i
                                                                                       else (if f1 a s i 0 then true
                                                                                                           else useful b s i))
                                                                else useful b s i  
                                   |[]-> false;;
let rec is_sov1 s i = if i < String.length s then (if useful l s i then is_sov1 s (i+1)
                                                                   else false)
                                             else true;;
let rec is_sov l = match l with a::b-> if is_sov1 a 0 then is_sov b
                                                      else false
                               |[]->true;;

let rec print_bool b = print_string (if b then "True"
                                          else "False");;


print_bool (is_sov l);;
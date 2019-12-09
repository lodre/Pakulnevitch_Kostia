let l = ["00";"01";"10"];;            
let rec mixes (a,b) i = if (i<String.length a && i<String.length b) then (if a.[i]=b.[i] then mixes (a,b) (i+1)
                                                                                         else true)
                                                                    else false;;   

let rec iter f l s = match l with a::b->if f (a,s) 0 then iter f b s
                                                     else false
                                 |[]->true;;
let rec is_prefix l = match l with s::b-> if (iter mixes b s) then is_prefix b 
                                                              else false
                                  |[]->true;; 

let rec print_bool b = print_string (if b then "True"
                                          else "False");;

print_bool (is_prefix l);;                                          
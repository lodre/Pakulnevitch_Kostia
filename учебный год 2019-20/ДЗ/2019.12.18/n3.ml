let s = "10$01";;
let rec parse s i = if i = String.length s then []
                                           else (match s.[i] with '0'->  0
                                                                 |'1'->  1
                                                                 |'$'-> -1
                                                                 | _ -> failwith s ) :: (parse s (i+1));;
let l = parse s 0;;
         
let rec print l =
let rec print1 l = match l with a::b->(print_string ";";print_int a;print1 b)
                               |_-> print_string "]" in 
match l with a::b->(print_string "[";print_int a;print1 b)
            |[]->();; 

print l;;
                                                                        
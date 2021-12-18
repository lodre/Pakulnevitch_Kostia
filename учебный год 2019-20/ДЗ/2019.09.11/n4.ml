let f = open_in "text.txt";;
let rec words s i = if i < String.length s then (if (s.[i]=' '||s.[i]='\n') then ""
                                                                            else (String.make 1 (s.[i]))^(words s (i+1)))
                                           else "";;
let rec next1 s i= if i < String.length s then (if (s.[i]=' '||s.[i]='\n') then next1 s (i+1)
                                                                            else i)
                                           else i;;
let rec next s i = if i < String.length s then (if (s.[i]=' '||s.[i]='\n') then next1 s (i+1)
                                                                           else next s (i+1))
                                          else i;;
let rec words_list s i = if i < String.length s then (words s i)::(words_list s (next s i))
                                                else [];;                     
let rec avar l = let rec ava l = match l with a::b->a +. (ava b)
                                             |[]->0. in
                    (ava l)/.(float (List.length l));; 
let rec mo1 l = match l with a::b->(String.length a) + (mo1 b)
                           |[]->0;;
let rec mo s = let l = words_list s 0 in
               ((float (mo1 l))/.(float (List.length l)));;
let rec read l = try
                     let s = input_line f in 
                        let x = mo s in
                           read (x::l)
                 with _-> avar l;;
print_float (read []);;
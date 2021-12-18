let s = "abcd abc ab a abcde";;
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
let l = words_list s 0;;                                

let rec mo l = match l with a::b->(String.length a) + (mo b)
                           |[]->0;;
print_float ((float (mo l))/.(float (List.length l)));;